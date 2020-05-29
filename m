Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A229E1E81F0
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 17:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgE2Pgi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 11:36:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:42790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726838AbgE2Pgi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 11:36:38 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB00E20776;
        Fri, 29 May 2020 15:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590766597;
        bh=+8XbA9yfRvYd3WH4x+WNAh3iFVXHLrKuuWpb9+uRTDY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=IQbN0x3MKDxIQ9KeRlyuQqNWVm9aGh4djJnftYgl2nhoXhCgWFM0B6BQvBbRnP0uo
         nr0Hne1P/drq7sX2HNzWpvd7bwQxB76pO9B+E4n6FAhmBBCZbMSyam9kqsJBGgolc9
         b41rk9zrXN/N45Osgwb2i/1Zowcskz8phwZuQzrA=
Date:   Fri, 29 May 2020 17:36:34 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [bug report] Revert "media: staging: atomisp: Remove driver"
Message-ID: <20200529173634.20056578@coco.lan>
In-Reply-To: <20200529104107.GA1306497@mwanda>
References: <20200529104107.GA1306497@mwanda>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 29 May 2020 13:41:07 +0300
Dan Carpenter <dan.carpenter@oracle.com> escreveu:

> Hello Mauro Carvalho Chehab,
> 
> The patch ad85094b293e: "Revert "media: staging: atomisp: Remove
> driver"" from Apr 19, 2020, leads to the following static checker
> warning:
> 
> 	drivers/staging/media/atomisp/pci/atomisp_acc.c:207 atomisp_acc_load_to_pipe()
> 	warn: pointer comes from user 'acc_fw->fw->blob.code'
> 
> drivers/staging/media/atomisp/pci/atomisp_acc.c
>    168  
>    169          acc_fw = acc_alloc_fw(user_fw->size);
>    170          if (!acc_fw)
>    171                  return -ENOMEM;
>    172  
>    173          if (copy_from_user(acc_fw->fw, user_fw->data, user_fw->size)) {
>                                    ^^^^^^^^^^
> The acc_fw->fw->blob.code pointer isn't annotated as __user data.
> Eventually it gets passed as "data" to int hmm_store() and treated as
> a kernel pointer.
> 
> Presumably only privileged users can load new firmware so this isn't
> a serious security bug...

Yeah, the firmware file is received only at the device probe's time
(or at open).

On a side note, after looking on some things today, I'm not even sure if the
code under atomisp_acc is ever called. The firmware file is actually a
container with several binaries of different types: "normal" files,
and 3 types of "accel" files (used by this _acc code). At least at the
two firmware files I'm using on my tests, the only binaries available
are from the "normal" type.

In any case, except if someone write it first, I'll try to write a
patch for it (as the upcoming merge window would permit).

>    174                  acc_free_fw(acc_fw);
>    175                  return -EFAULT;
>    176          }
>    177  
>    178          handle = ida_alloc(&asd->acc.ida, GFP_KERNEL);
>    179          if (handle < 0) {
>    180                  acc_free_fw(acc_fw);
>    181                  return -ENOSPC;
>    182          }
>    183  
>    184          user_fw->fw_handle = handle;
>    185          acc_fw->handle = handle;
>    186          acc_fw->flags = user_fw->flags;
>    187          acc_fw->type = user_fw->type;
>    188          acc_fw->fw->handle = handle;
>    189  
>    190          /*
>    191           * correct isp firmware type in order ISP firmware can be appended
>    192           * to correct pipe properly
>    193           */
>    194          if (acc_fw->fw->type == ia_css_isp_firmware) {
>    195                  static const int type_to_css[] = {
>    196                          [ATOMISP_ACC_FW_LOAD_TYPE_OUTPUT] =
>    197                          IA_CSS_ACC_OUTPUT,
>    198                          [ATOMISP_ACC_FW_LOAD_TYPE_VIEWFINDER] =
>    199                          IA_CSS_ACC_VIEWFINDER,
>    200                          [ATOMISP_ACC_FW_LOAD_TYPE_STANDALONE] =
>    201                          IA_CSS_ACC_STANDALONE,
>    202                  };
>    203                  acc_fw->fw->info.isp.type = type_to_css[acc_fw->type];
>    204          }
>    205  
>    206          list_add_tail(&acc_fw->list, &asd->acc.fw);
>    207          return 0;
>    208  }
> 
> regards,
> dan carpenter



Thanks,
Mauro
