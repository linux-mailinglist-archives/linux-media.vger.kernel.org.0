Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E335A322DF
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2019 11:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfFBJ62 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Jun 2019 05:58:28 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46969 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbfFBJ62 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Jun 2019 05:58:28 -0400
Received: by mail-lf1-f67.google.com with SMTP id l26so11250253lfh.13;
        Sun, 02 Jun 2019 02:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KXYdQUKOB+u8P8O0FLkc8ya3EQeBwf41WKBLmxzpcZ8=;
        b=LdCHiT4iF98VJLu5ZMvzSz38dc/ItvhnlFx31mlMK2Vf03KnfWwFAHurWxS9nDTfXH
         YcC1IeRkfRRjbbSQrK/aWXZiiEFk7LGQaF/FJaljcx3w/Qqlu9QupnVXYK7CRbhS5PpT
         hdUqNvBFd2jxQROycjwwYDbeM1IMtpJXpKG4RTdyqLHwYW8Xh3ke4mHWBDf+c4Yn3QfU
         mUB3PStp3TNNvFU6BbeYpD1qZdcqUoEtImPDIyjS2DCB0fqtjgiWB0jXM8saUF+17tLC
         krLRcqcdtWrvSL65EjEt2exgMdB47g0GiUPV+9MkQ8sHpCna+vxtxtScZGvkpB65VfFN
         figw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KXYdQUKOB+u8P8O0FLkc8ya3EQeBwf41WKBLmxzpcZ8=;
        b=lC5WGA9xM89xfPd4e9BBAzlaFcuPZQxbMButmR338z+uyr7LCB5oAkeVhhmkOeYpGg
         1VYNGvGUKUn5A1fW3+Qhr8BDszMfu9ugNwbL4jBtfRTJZ2VdpXV/G5k1wl4/sWbhrZjg
         QNUOV3CBWXLCBn/9CadIEcMhga+IqR1eVHjZjNrhV2lMBspK/7ZZIwVBduQ1S5Clib9t
         ySXBuO3eHFy0jib1OkNrfBgh5qdGEFdXhMgKcmJ7AvWOX6gxYssQ9PHqlhRr8/HtL7cJ
         nA96Zuv3cvZIqt6u/x3dc9sdYk2tHO4r2wF0Xofjk3+PCfpESfL6npqAGrgPxozPtAjL
         NiIA==
X-Gm-Message-State: APjAAAWuAAmxIiTZaFj40xjule8uLbUY5OycAkSSjjOwDYV2OV70ODnF
        88XB+mG7WSw+e/ldExm9zym8xBJQGK4=
X-Google-Smtp-Source: APXvYqxGmln9Il6VJ+XoG/EXc4W4C3KnoHhayvnOMRO5/QPDWyvfjM+mdMCh6OS1D1GVRiYbnEgijQ==
X-Received: by 2002:a19:6e41:: with SMTP id q1mr3115326lfk.20.1559469506305;
        Sun, 02 Jun 2019 02:58:26 -0700 (PDT)
Received: from z50.localnet (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id r11sm1660323ljh.90.2019.06.02.02.58.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 02:58:25 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [RFC PATCH 4/5] media: ov6650: Fix frame scaling not reset on crop
Date:   Sun, 02 Jun 2019 11:58:23 +0200
Message-ID: <11387277.ecJxfdHps5@z50>
In-Reply-To: <20190601223754.65soglqayxrblgzl@mara.localdomain>
References: <20190526204758.1904-1-jmkrzyszt@gmail.com> <1933971.yMpNBnsSgY@z50> <20190601223754.65soglqayxrblgzl@mara.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Sunday, June 2, 2019 12:37:55 AM CEST Sakari Ailus wrote:
> 
> ... I realised that the subtle effect of "media:
> ov6650: Register with asynchronous subdevice framework" is that the driver
> is now responsible for serialising the access to its own data structures
> now. 

Indeed, I must have been not thinking much while preparing it, only following 
patterns from other implementations blindly, sorry.

> And it doesn't do that. Could you submit a fix, please? It'd be good to
> get that to 5.2 through the fixes branch.

How about dropping that V4L2_SUBDEV_FL_HAS_DEVNODE flag for now?  I think that 
will be the most safe approach for a quick fix.  I'd then re-add it together 
with proper locking in a separate patch later.  What do yo think?

Thanks,
Janusz


