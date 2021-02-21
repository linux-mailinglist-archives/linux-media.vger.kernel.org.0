Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 827493209A2
	for <lists+linux-media@lfdr.de>; Sun, 21 Feb 2021 11:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhBUKpc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 05:45:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhBUKpb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 05:45:31 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A6DFC061574;
        Sun, 21 Feb 2021 02:44:50 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id u4so46459439ljh.6;
        Sun, 21 Feb 2021 02:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:mime-version
         :content-disposition;
        bh=STQfoSu8Rvq6MxU4djWNXK4UVlp2NhVlvz/bJOuJaYY=;
        b=i4Mq6YVaJ26zIo120j9W13hsO/xTTMC1YxfPILWPUfHFlOk4bwRk3SQvlmQdCD11Pn
         s/uSyTXMW7f6T6Da8StjpTrkTLeIyi/3Oq85avb/cj6CUaODdedYqEuvx4HCbvkod89b
         zQ1jVLIt7ob8r3h1N/MzTEtN+Izl8iYbX65PLksYPdSdifJOlP9iHb7KhxBsvU6ejcbe
         xdccCVbNtyc9lLOxLuDDHPXXC1rK77LRCvBM4pmQAZuo9qlUOrJeKf9Jyhqqv9LMu/NZ
         VD+7Vyn3Ap+DIQkJm67xrABAhyxu4miIKLD/phwpJgRp0v5GW/rMaVqQ6OVtQeURBYE/
         mQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :mime-version:content-disposition;
        bh=STQfoSu8Rvq6MxU4djWNXK4UVlp2NhVlvz/bJOuJaYY=;
        b=UIq0qMjrPqjgoc7TxhcWscLJcphKVmhXanfa75yXD7C1dDNQ/wpWHTYLUkrEJht5Ka
         7N3Fa1zUk6o/eiS0UWq2gp8tty+Ytt4XDbbcnugKXtwB+VqAHZr46R9Ctt6XggQFXRDG
         tVoNUQN7KwTiz9tlLMeJwSVeNkJFuSSSlN1xUcXS/ZLhKACQBZVoiVnE3WfOqINz624c
         PSVHCxFj2NgXhKgGGFyWtvzUVIUpTNB82Dl5dDkJkLOANHnpTsYfU/zPMz1TemBnSBt4
         SQ3NjsaXQbWgxBBcIQBri71izmOCGlFfv1uCUh7Qlu737EoKGhRwywJz7KzLjApljiIR
         CQxw==
X-Gm-Message-State: AOAM532FIKPNp2rOAARunNBkgF3ZNuhBTVsdV+MH4qylbD3Ez2nQKT8W
        OVCC8SiK2/JcR+DWhx/MfMk=
X-Google-Smtp-Source: ABdhPJzaCyp5/09lYkRIHrHIeSN4vDyRBkoJsxZ8R1znH7pifn0NYt+tlvkQ0XFYNlkl54JOBBXV1Q==
X-Received: by 2002:a2e:5719:: with SMTP id l25mr11396464ljb.76.1613904289154;
        Sun, 21 Feb 2021 02:44:49 -0800 (PST)
Received: from msi.localdomain (vmpool.ut.mephi.ru. [85.143.112.90])
        by smtp.gmail.com with ESMTPSA id t19sm1519248lfr.106.2021.02.21.02.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 02:44:48 -0800 (PST)
Date:   Sun, 21 Feb 2021 13:42:58 +0300
From:   "Nikolay K." <knv418@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: media: ipu3: code style fix - missing a
 blank line after declarations
Message-ID: <YDI5MtxbNLjpSHwY@msi.localdomain>
Reply-To: YDIX3Q0U8/PcVWgN@kroah.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I can't find any change in struct imgu_fw_info layout after this patch.
But warning is strange, because declarations don't actually end here.
So I think this warning should be suppressed to reduce noise
in checkpatch.pl output.
