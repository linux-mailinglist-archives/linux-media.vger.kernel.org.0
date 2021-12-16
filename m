Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1819B477D8C
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 21:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241417AbhLPU1Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 15:27:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240527AbhLPU1Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 15:27:24 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B86C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Dec 2021 12:27:23 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id m6so355745lfu.1
        for <linux-media@vger.kernel.org>; Thu, 16 Dec 2021 12:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yp8nR+Sm7SDCOEKQCHnVDUVfeKtATtEq7tPYFmHOlS0=;
        b=j5KiwllH+w0gArstm+342bdDvALLXYB1P6W58MjDSXcYtxYoBGclrKTamcKv2w04PC
         Aduypv/tdjUjMP7RjUFUrk7KVWvrI+9V8eif6ROp4Y86DXrqF8NYxr35A1RSbjfCsG84
         b+xA681BMzseGzy9Jy00rgbvNdcmb+xzqXSc5HbqxA8KPOeJRxqhcNb91KsypB9Fk53n
         0knaC8Ktvd7lE6Z/2qkU2tBBF7W0Met7FVN//3TLuerkdlx2i0lmJa4NB9kBPv1I7Pfh
         1wZpbYwgqEPQepruyE0cPolHGg2OKn7/HXGvluEXQ0ZM74u0GNOOK/55mADX0eJ5wzMe
         Dadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yp8nR+Sm7SDCOEKQCHnVDUVfeKtATtEq7tPYFmHOlS0=;
        b=DnTFrlJAbNY0vchEv0xujEqIlcHoEYPfr45ZM68Y+EtPkqxM553Q0JVT+C/Tfep9Cv
         MKsFzopZDlIyJi1aJ6/VDb3Nqv4ERPt0FJUGjjq76714mUOBDDOKe7Df9jz7wyzIytz1
         z2vlCbJLSAtwwZZzUA0CUN/zn4j486i/RnDUiKtrtUMGQo9e4t1Xx4+2avNXRxHb1Y0d
         9eBUNTmdyzS45+NpoXncxfZMcbvp2N0ZCgtEsxrHksN2MPnrU4sNKgrcLbMXhMDFzckQ
         7lj+kkejLzu/P1vw0pCQ5cFSkl6vaKWiBb9wP5NMJDgD0RuCxFv2rN+G5dP68N9Grp6i
         vCLg==
X-Gm-Message-State: AOAM532IV0h1lQSJvKOGJOHR723dq6rHdDTKL6GetLWzN7Wjajuvr1P3
        wI1mNWXxFtAYrVmG6nllHBVJdvA2uFlIIA==
X-Google-Smtp-Source: ABdhPJwu5TmQnMKAPgGjs5Af+64FWyTqvCaGacmRJr3sLSW5Uqtw1IrMpLJUwH5LjX2ZL9FYi9lr2A==
X-Received: by 2002:ac2:4e61:: with SMTP id y1mr16722072lfs.459.1639686441386;
        Thu, 16 Dec 2021 12:27:21 -0800 (PST)
Received: from localhost (h-46-59-90-226.A463.priv.bahnhof.se. [46.59.90.226])
        by smtp.gmail.com with ESMTPSA id d23sm1033112lfm.107.2021.12.16.12.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 12:27:21 -0800 (PST)
Date:   Thu, 16 Dec 2021 21:27:20 +0100
From:   "Niklas S\\xF6derlund" <niklas.soderlund+renesas@ragnatech.se>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [git:media_tree/master] media: i2c: max9286: Use dev_err_probe()
 helper
Message-ID: <YbuhKCR56T0txqUS@oden.dyn.berto.se>
References: <E1mxwo1-005rm2-68@www.linuxtv.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1mxwo1-005rm2-68@www.linuxtv.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thanks for merging this patch.

On 2021-12-14 15:19:04 +0000, Mauro Carvalho Chehab wrote:
> Signed-off-by: Niklas S\xF6derlund > <niklas.soderlund+renesas@ragnatech.se>

Could you please fix this?

This have worked in the past. But for the last ~week or so all patches 
merged by you have had my SoB and R-b tags mangled in this way.

-- 
Kind Regards,
Niklas Söderlund
