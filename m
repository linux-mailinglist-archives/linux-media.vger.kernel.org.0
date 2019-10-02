Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18CAFC8AA2
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 16:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbfJBOMu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 10:12:50 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40321 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbfJBOMt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 10:12:49 -0400
Received: by mail-lj1-f196.google.com with SMTP id 7so17276240ljw.7
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2019 07:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MKzB4Xgzx1wF7f/qvVY70hAbC4oof1oHaCdrSwdO7fI=;
        b=fpoAU7w6+4T6zlaVRmDzxDmltvSwSN8JFMn9sAtjN3uMOhYh0MxzlxMda4ucgIC4M0
         DXxwnkFnEU54IYz+qFYrZOAJ/zY3V6cXd37n1FCIzgvQ+3AtdLrvN32XwU45ic0HHeB7
         sCWnZcjIctkHf4UYAWXSDumwblRotHBrfLfATQdJA+4Lk7yNIhzOdH5LO1muMc7RCCgR
         EdVhqdJmOlOajpcZ4HvCLX4q3nvRmjkdeo4JQzOc8pyI+0CF2NQssBvjYSzxCZ94Hf34
         3aesx9CKk+Mjzh+RtY6UFuxMArVvz21gYnVxIJA+P2IFUoADxLPQlobabivOnZH+fnFa
         nNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MKzB4Xgzx1wF7f/qvVY70hAbC4oof1oHaCdrSwdO7fI=;
        b=m17RCyiEnVCMtfNg49p2CdNQcKFFSe72DFDTcWWkSHjZebLvLpm9pavHqK4bVj2HTa
         oDoTRPQ2g9sfvDzXXXc2EUa/rx1+Q3PUJKmAOsBkY0HhII54NSFE6Hq7gUCfoqQ35T1I
         USk13IfR7lHut5ay0Ojr99RpXuhOG5exEPZxi/05UIQ3xX+RvfI/Nxx6K2EW/BO23Hot
         WO2A0+NovK0Bl/hSAP34rsMd1gjOP57JGBnU4SauhPTWHmVKA3L2xNCoGFwR/hV+gOxd
         7RtQtLoUPdDz9LiZD3jBw4934tiafkUwWJIN7uj4EUdMTBS7qvOPPRZPDrEoU6uuCvPm
         8JTQ==
X-Gm-Message-State: APjAAAUVl/VfJOs2vM5S1AGtxL5/ZLSwt9z70RRj77cA8aQxYxo4bQxj
        9WeNsvYrjQDG9pEQvyiC6Kv+PEhvZqE=
X-Google-Smtp-Source: APXvYqzRkCAM8UWH4xxqHRRrz2Y2WCxBidH2dNxB7BquzKx2pcO8O/DHgmZEx/6DcOYb8uygwRrvaA==
X-Received: by 2002:a2e:9750:: with SMTP id f16mr2648305ljj.239.1570025567094;
        Wed, 02 Oct 2019 07:12:47 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id z16sm5458759ljz.72.2019.10.02.07.12.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 07:12:46 -0700 (PDT)
Subject: Re: [GIT PULL for v5.5] Venus updates, take 2
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <20191002112953.16642-1-stanimir.varbanov@linaro.org>
 <20191002110150.1c6336a3@coco.lan>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <751dc692-929b-101d-00cc-08db1e55cff0@linaro.org>
Date:   Wed, 2 Oct 2019 17:12:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002110150.1c6336a3@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On 10/2/19 5:01 PM, Mauro Carvalho Chehab wrote:
> Em Wed,  2 Oct 2019 14:29:53 +0300
> Stanimir Varbanov <stanimir.varbanov@linaro.org> escreveu:
> 
>> Hi Mauro,
>>
>> The Venus driver updates include:
>>
>> * three fixes: fail to suspend, enum frameinterval issue with encoder
>> and frequency table modifications for v3 to handle performance issues.
>> * two new features: interconnect bandwidth support on v4 and more precise
>> clock-scaling on v4.
>>
>> Please pull.
>>
>> Changes since v1:
>> Fixed checkpatch error/warn in 0003-venus-venc-Fix-enum-frameintervals.patch
>>
>> regards,
>> Stan
>>
>> The following changes since commit 503e59365dd134b2c63864f14e2de0476284b003:
>>
>>   media: i2c: ov2659: Switch to SPDX Licensing (2019-10-01 17:39:16 -0300)
>>
>> are available in the Git repository at:
>>
>>   git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.5
>>
>> for you to fetch changes up to e8938a0b5beb6f0fafc921010375cda64a5a4592:
>>
>>   venus: Update clock scaling (2019-10-02 14:17:23 +0300)
>>
>> ----------------------------------------------------------------
>> Venus updates for v5.5
>>
>> ----------------------------------------------------------------
>> Aniket Masule (2):
>>       venus: Add codec data table
>>       venus: Update clock scaling
>>
>> Loic Poulain (1):
>>       venus: core: Fix msm8996 frequency table
>>
>> Stanimir Varbanov (3):
>>       venus: Use on-chip interconnect API
>>       venus: venc: Fix enum frameintervals
>>       venus: Fix occasionally failures to suspend
> 
> Hmm... I'm not seeing the patches at the ML. Please always send them
> to the ML, in order for them to be properly reviewed.

All patches are posted on linux-media at least, maybe the problem is
because I changed patch subject to start with upper-case instead of
lower-case in pull request.

> 
> Btw, I have some issues related to this patch:
> 
> 	venus: venc: Fix enum frameintervals
> 
> Thanks,
> Mauro
> 

-- 
regards,
Stan
