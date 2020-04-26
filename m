Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D82A1B8C9A
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 07:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgDZFvW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Apr 2020 01:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725468AbgDZFvW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Apr 2020 01:51:22 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D71DC061A0C;
        Sat, 25 Apr 2020 22:51:20 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id f11so9513667ljp.1;
        Sat, 25 Apr 2020 22:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9l6cZQwVi62pvIqETuB/BI3xEqSyHGo+hbBw6siI59Q=;
        b=QsL3MOnLLUGvNM05WV+aiR2DQodDwGyBvcnEjIIYEp5CoUMxgK1io1QLNt9b10HmHj
         AR0sd3DwFgI9Ggl3T/ll2g/MlH+SthYXi27cEZz27VNqly0cSjXXiQHiyIF5q/OM8zJn
         FMK2+uPTJwTP+B1IvySGsI22KFmjqqnA+u2OIvpbGBDiU7sFFIXzR5M9JFcVh9gsJigg
         7/VGyKEBWHxmFHQzf17z6xwRYvl9pjo/n8xyvOwW5A4FUv2dagWYdR46b0356C1ZLxj5
         suaF4uIhPTaCA/7qfrarUHdTemtlNJdnBGH+KvV7Awe2AeMYlKS/FM9I4KkOd2as40pk
         B1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9l6cZQwVi62pvIqETuB/BI3xEqSyHGo+hbBw6siI59Q=;
        b=e7NB006wz98AZJ1BxHR7W39BfK0B/KUGBBSYqsYwu+nYTGAufekaQWLIPFp1Hlzv1X
         8SdJFE3YIdaiSKYPmwIebQXeScWIXk85RRNjRE8+E2KWay+2aNWspxRlIMFtYHtzCgbd
         KzOSt3QM4FrQl8N3AbsKTSTiCxuHrcNKKi/d8tYnqwa5tOS5I25Y5t0doZWEiIwpZgbV
         +yrSP3/TPRysWCEXQvQTWPwrrWM1pnFXgo6W+DAdds4Ig6PnfZx5o5n4RV7QcYzx5AvO
         5mz+LuDyQEKbLKgEfat5YOf5St5SA2tuCH0ygl9c6unvb5LoGCOTXHHjeJFz0I/g6CNw
         m49A==
X-Gm-Message-State: AGi0PuZ07W3+6mei2wM6ILsBOcUV9owcahizx0OT6bDC79h1b35Czfv2
        BEk1oSO06LIXRod73L6atQrIGzZq
X-Google-Smtp-Source: APiQypKbEXF0/MPHXCyXmrFS0UvNJxZgw+x9UT0Pv1dZWn7VGPCfOJZMhJH//mO4lcNdeMODvcw1bQ==
X-Received: by 2002:a2e:8056:: with SMTP id p22mr10800739ljg.266.1587880278443;
        Sat, 25 Apr 2020 22:51:18 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id i20sm8771214lfe.15.2020.04.25.22.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 22:51:17 -0700 (PDT)
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, frankc@nvidia.com, sakari.ailus@iki.fi,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <6ca93ff9-ca59-544f-767c-4355d01a5c20@gmail.com>
 <62546d1f-eca5-06be-2bc2-e45ccd53830a@xs4all.nl>
 <50fd1016-ca8b-ec5d-e5a8-f257138b152e@gmail.com>
 <658c4232-94d9-3051-8c93-bff7046cf5f2@nvidia.com>
 <03426915-25ea-69b4-bc64-f87f3046d33f@nvidia.com>
 <aabaecc4-3494-0137-7d2b-853304bfa68b@gmail.com>
 <09f20441-fec6-7496-2edc-c69db535e441@nvidia.com>
 <61799fab-858c-8b0d-ba7d-846cd041e044@gmail.com>
 <7dfca778-e402-3a6f-617c-dd8448187a13@gmail.com>
 <be48a991-3047-6ee3-8d6f-85979752d86f@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <edad2953-ff4c-7c3c-4550-a3638a714c65@gmail.com>
Date:   Sun, 26 Apr 2020 08:51:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <be48a991-3047-6ee3-8d6f-85979752d86f@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

26.04.2020 07:47, Sowjanya Komatineni пишет:
> 
> So, probably what we have regarding structure is ok except video formats
> I will move to Tegra210 and change defines to use Tegra210 prefix.

If those defines aren't reusable by T186, then you could move them all
to t210.c.
