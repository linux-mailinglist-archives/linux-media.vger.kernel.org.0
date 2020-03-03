Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B57617799D
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 15:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729515AbgCCOwN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 09:52:13 -0500
Received: from mail-lf1-f41.google.com ([209.85.167.41]:35194 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729138AbgCCOwN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 09:52:13 -0500
Received: by mail-lf1-f41.google.com with SMTP id z9so3013277lfa.2;
        Tue, 03 Mar 2020 06:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YSesgEwKuIBfRjb3D6rghMgTaq2QLhVxxb+yvFprsHU=;
        b=N9/JqnZo39MgJ7UX+Yc1KAct18f+YcXWyJAE3ApycATyPTtF7RgVKrXa83f6+2Bq7d
         L8Z12akelacBMh0bc7uF8beWJUD19foqto6e+VJIIhKV72D3bnB+20Nna/TWtOKanzBl
         LCnWP4W6W7msmSTj5rh8pehEEmT4n5oPnPG8XxfxEWp/tpZ7059Ae6LLiCqdaVQJHaNI
         j+Z4U1uFeYtXqEPPDavjKhrn+otqHkncSq+tdobkNEKhlaeADZOnZthQbato8RLX4yB8
         FW6EPxoutKio9w3A5StQUgozmvyVjW6NAJit3tpxR3QZayUkKLEB13THJrZjbLPo7444
         nRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YSesgEwKuIBfRjb3D6rghMgTaq2QLhVxxb+yvFprsHU=;
        b=tzaLx5T7s8tPfI+Hqd10PoisiSyGEoU60pKzzhW6XH84241lkqDnT/Ms7hzOqYRulq
         mvMjgZwwJ3A31xNGMKYxCYalMYcobNCf/IRxy1LwTKXitaPcKUnpsterP5ebkdkbYdVf
         6aFy3GTq7MBKEFBwK1OY4JPeLzkoh7G8YcW9TfYyKs991y1dfEGudTn61ltiyiyE7Ac+
         JJdsHzM5joTlJo2HddAf7XLWzgPLpXfqDhjQ1/tRuhr3AZp94ovg7dXCGrq5R40izKME
         s+Lfb6FUAuOlbzB2vkS4Q9+rxIdyKibdzYzTEdguXPSVFJUfzBetDrXDj57NIrWbSVb7
         vfbA==
X-Gm-Message-State: ANhLgQ2/WbR9twXMW3DPzz1mXaNFGWSiVkTiB6r/UHtRUtcgjGkdQJgD
        ByVSkRxIEOIOeypcuR/4ltP18Vl2
X-Google-Smtp-Source: ADFU+vt+Hda+OcEsW87pxEsFqBcqlkHXCcQzYKTyKxjdeDZNADrgVxUP8SzNLJpKFRCEfBtF4gBglQ==
X-Received: by 2002:ac2:4911:: with SMTP id n17mr3069057lfi.79.1583247129730;
        Tue, 03 Mar 2020 06:52:09 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id i5sm13008574ljj.29.2020.03.03.06.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2020 06:52:08 -0800 (PST)
Subject: Re: [PATCH v2] media: staging: tegra-vde: Use
 devm_platform_ioremap_resource_byname()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
References: <20200302172904.460-1-digetx@gmail.com>
 <20200303073134.GF4118@kadam>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0e4c875b-e859-2621-9252-dbd6a69d244c@gmail.com>
Date:   Tue, 3 Mar 2020 17:52:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303073134.GF4118@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

03.03.2020 10:31, Dan Carpenter пишет:
> Thanks!
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

Awesome, thank you :)
