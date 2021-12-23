Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE9F47E1DB
	for <lists+linux-media@lfdr.de>; Thu, 23 Dec 2021 11:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347820AbhLWK7X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Dec 2021 05:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243250AbhLWK7W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Dec 2021 05:59:22 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19AD3C061756
        for <linux-media@vger.kernel.org>; Thu, 23 Dec 2021 02:59:22 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id v15so8679231ljc.0
        for <linux-media@vger.kernel.org>; Thu, 23 Dec 2021 02:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c4iGsoh91KxrBrGqNFTJPQDy9ooHu40v3iiRctF/iBc=;
        b=EBJc5nrK6p9j6veHdYAAn3scocsoVPD7XdVbJoxP1ulH2p7QyiOSCXbT2xZe8LSVTV
         eWmj+4Y/y60m/gKXpQNTf8bad6tstfny3dEgun071F8N0Mfmka+sJ+HaBCSOPeifbZak
         CtWe93t0S4TzF9yByovOrLtGFV/ONI8vREtX1ENZv/tOKJ3BKIupOTolTB2Na37easpO
         9ht+6aDNfbUGeA83KmfB1tXduOx0LfqzRSUb9Dg69a3RvbHOmeba9K2eVzcj2QpdakZM
         LJeBgFb9zaX/zk6FA2Is4luDkTzddWQAMqcKJBAHcPv2oxt0oAD9tcCyW2M5Z8R6OeXz
         pJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c4iGsoh91KxrBrGqNFTJPQDy9ooHu40v3iiRctF/iBc=;
        b=XG3JN1I/UmxsABfYqICaMEGu2oYiDll/AE6YxMR3GeIRUrruP8apfoStLm5llfPLGT
         DIraeV9ZIp9xV78nKN0NiIOI89Y3TYCe6ja6uwpo9VVLsm/U2bW6DNpMDGo5Op30qsGo
         LoulMsgc+VAh8dc1VbhZ63EIXjkrkumzfzfsC6JpIwLlwPQ957FJYXuhgPqxLePNQSmA
         dHsrkiHsW9ecYpZ3kLC4PTHpjttp8/RRl672IS+vm/4K9yyiol3srzUq+rh+pdp7gICJ
         vx9tao8TULPMmUGOJ0PdT7excBkOc+dvTJy7F2G4/nRixFX/e4TlTInHVXaGQhLs/q2f
         yRBQ==
X-Gm-Message-State: AOAM533zQnla8hsuyf/uuZt0IyJqZvY/HQP92zFXsssko6vGy11c+6/p
        LwLa94eYA/+R4FsG763wER7UHA==
X-Google-Smtp-Source: ABdhPJzrM6Yg+3CEQag1QkRcx4LReAIp1OuWGROh3rLAvg9Pdp7MIzV4ecsfH5Te3AIhQWyFEDqZTg==
X-Received: by 2002:a2e:9b88:: with SMTP id z8mr1325078lji.65.1640257160267;
        Thu, 23 Dec 2021 02:59:20 -0800 (PST)
Received: from [192.168.1.102] (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id m21sm452454ljp.66.2021.12.23.02.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Dec 2021 02:59:20 -0800 (PST)
Subject: Re: [PATCH v3 00/19] CAMSS: Add SM8250 support
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, dmitry.baryshkov@linaro.org
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <2f3eb25d-3af9-4339-acb2-8d5b01e5881d@linaro.org>
Date:   Thu, 23 Dec 2021 12:59:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/22/21 2:37 AM, Bryan O'Donoghue wrote:
> V3:
> Publishing this V3 to make it a bit easier to merge
> 
> - Adds Rob Herring's RB for the first DTS change
> - Adds Robert Foss' RB for the final three patches
> - Validated on latest 5.16-rc6 on rb3 and rb5
> - No functional changes to v2
> 
> Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=v5.16-rc6-sm8250-camss-imx577-only-v3
> Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=v5.16-rc3-sm8250-camss-imx577-only-v2
> 
> RESEND V2:
> + Cc: devicetree@vger.kernel.org on first patch
> 
> V2:
> - Adds Tested-by Julian Grahsl as indicated.
> - Fixes low-level noise checkpatch --strict
>    I ended up having to push defines into static inlines for this.
> - Adds Reviewed-by Robert Foss.
> - Adds VFE/CSID fix for sdm845 as explicit additional sdm845 specific
>    patch per Robert's suggestion.
> 
> I took the time then to test out on sdm845 to ensure the new patch breaks
> nothing "./cam -c 1 --capture=1 --file=capture.raw" continues to produce
> expected data.
> 
> Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=v5.16-rc1-sm8250-camss-imx577-only
> Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=v5.16-rc3-sm8250-camss-imx577-only-v2
> 
> git diff v5.16-rc1-sm8250-camss-imx577-only..v5.16-rc3-sm8250-camss-imx577-only-v2 -- drivers/media/platform/qcom/camss
> 
> V1/RESEND:
> RESEND: git send-email --to=inux-arm-msm@vger.kernel.org -> --to=linux-arm-msm@vger.kernel.org
> 
> This series is imported from excellent enabling work contributed by
> Jonathan Marek which we have picked up in Linaro for the RB5 project.
> 
> Link: https://patchwork.kernel.org/project/linux-arm-msm/patch/20210511180728.23781-2-jonathan@marek.ca/
> Link: https://www.qualcomm.com/products/robotics-rb5-platform
> Link: https://www.96boards.org/product/qualcomm-robotics-rb5
> Link: https://www.thundercomm.com/app_en/product/1590131656070623?index=1&categoryId=category0&tabIndex=1
> 
> The RB5 has a slightly different sku I think to Jonathan's platform -
> QRB5165 in our case with a different version of LK the relevant bootloader
> for the board.
> 
> As a result we needed to make some additional updates to the provided
> patcheset, included here.
> 
> The most notable changes are:
> 
> - Addition of clocks.
> - Addition of bandwidth settings.
> - Representing the dependency on a VFE for a given CSID so that V4L
>    subdevs will come out of reset right when poked.
> 
> A full tree which is bootable and capable of producing pixel data from the
> imx577 main sensor is available here, with this series being a sub-set of
> the necessary patches on the SoC side only.
> 
> Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=v5.16-rc1-sm8250-camss-imx577-only
> 
> media-ctl --reset
> media-ctl -v -d /dev/media0 -V '"imx412 '20-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 

Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

I've tested the series on top of v5.16-rc6 on RB5 board, image capturing
from the imx577 sensor works fine, if I use the supplied rb5_defconfig.
However I have to report that the camss driver is not probed successfully,
if it is built-in, then there is an issue related to device link suppliers:

	platform ac6a000.camss: error -EPROBE_DEFER: wait for supplier camera@1a
	platform ac6a000.camss: Added to deferred list

This could be analyzed separately.

--
Best wishes,
Vladimir
