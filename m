Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3AE81926DB
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 12:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbgCYLJr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 07:09:47 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:43879 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726043AbgCYLJr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 07:09:47 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id H3umjbcsrfHuvH3upjwsDV; Wed, 25 Mar 2020 12:09:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585134584; bh=aeOdGZ6OgFt69qgvqx7eLLn3NGTxKw+2xezfTroXWTA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tzGy0N9y8M4l52nouIG4+WU6Z4gkn/Mdp1HQBA9tAkgNVOaG8GPhh1aetpvt4kiks
         /YQCaHbme2Sc6/8N+gXYTd3b0XVe6ZPOP3K7+71sUKaUGWlpAgg+6dL94jRqcBweed
         Sq9ci3BsuGd3kycMJhAEuo3pxnjBGoXZ1RE/d0z/5Y9V4QFB7ywXSHKd+34alM31a2
         dw7rWlK1pBcy8D2hsO+j+Gabu1ZZS60UJ+DPRCqLzIHk20AG9GlRbS+KJvUxMxyt82
         mmfrNDYqpG3Jasx3wFv1sOJctAaKM5vitwzRNo8Uk41bieJCCmlmRf/E86bJlF+nDP
         Ea9T3arrgpYsA==
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        helen.koike@collabora.com, digetx@gmail.com, sboyd@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
 <20200325110358.GB853@valkosipuli.retiisi.org.uk>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <af710b95-55a5-8f20-6617-c1e6f9a3fe79@xs4all.nl>
Date:   Wed, 25 Mar 2020 12:09:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200325110358.GB853@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfASr57v1HrYBEDdTrXofqBhy5OyWTJt9e1V2D9AsPGRLMdFLfrHk4JYIO/wJ8mCWc1kRrmVkRa3VMq/uRJjL99iLl7N3BQCHPjDmyAQvJl8GwbmviRpJ
 2kUGLaETo3kWiJv6ySSmQWBpkKYrmuwcB2EMoZ1mW0Qm292OoTclC422cdpsXmO/WqAkjyyS0k4XkBHIHL0HAip25nzPrTG0jiH+FxVB68S0kpJOKPet4AX4
 cKqSYUcpP8ilU8Y6A+FI0PYh2Kfa2Rntk2bTiDE6vyD164N4lGNuSCoxAMD3m3aI2c0Y8yVM1DzRtpfaJZRdKVJpXnzGUWe8hxruHe3nC1G78tAB4xuyXFCs
 LZEvgsPZFojuOcunPRJllbqYEwItiTzawgSVgy7f5W4JzIeI9hwNjCexX/E3bRrMAia56iDlLuWNvv3GdagGtJvjLr3cCaWJGyT7YK64pilWc8V8d9L8GTx0
 XMEjizaV/E3frWDaNwoQVml+qXb9HziBMu4vg6K7qXG1i7HwcEFNO+MrZ4b+IBRCHv2lQWTR6xAoUmdTTWDWTZwki51tM9JQdsORcSH7huS5XfzcBKp5ZDnD
 XGk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/25/20 12:03 PM, Sakari Ailus wrote:
> Hi Sowjanya,
> 
> Thanks for the patchset.
> 
> On Mon, Mar 23, 2020 at 10:52:32AM -0700, Sowjanya Komatineni wrote:
>> Tegra210 contains a powerful Video Input (VI) hardware controller
>> which can support up to 6 MIPI CSI camera sensors.
>>
>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>> capture from an external camera sensor connected to CSI or from
>> built-in test pattern generator.
>>
>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>
>> This patch adds a V4L2 media controller and capture driver support
>> for Tegra210 built-in CSI to VI test pattern generator.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  drivers/staging/media/Kconfig              |    2 +
>>  drivers/staging/media/Makefile             |    1 +
>>  drivers/staging/media/tegra/Kconfig        |   10 +
>>  drivers/staging/media/tegra/Makefile       |    8 +
>>  drivers/staging/media/tegra/TODO           |   10 +
>>  drivers/staging/media/tegra/tegra-common.h |  263 +++++++
>>  drivers/staging/media/tegra/tegra-csi.c    |  522 ++++++++++++++
>>  drivers/staging/media/tegra/tegra-csi.h    |  118 ++++
>>  drivers/staging/media/tegra/tegra-vi.c     | 1058 ++++++++++++++++++++++++++++
>>  drivers/staging/media/tegra/tegra-vi.h     |   83 +++
>>  drivers/staging/media/tegra/tegra-video.c  |  129 ++++
>>  drivers/staging/media/tegra/tegra-video.h  |   32 +
>>  drivers/staging/media/tegra/tegra210.c     |  754 ++++++++++++++++++++
>>  drivers/staging/media/tegra/tegra210.h     |  192 +++++
> 
> Why staging? Are there reasons not to aim this to the kernel proper right
> away? If you only support TPG, the driver may not have too many (if any)
> real users anyway.

A TPG-only driver is not very useful, and I do not believe that belongs in
the kernel proper. The next phase will add sensor support, and that's a good
time to move it in the kernel itself.

Regards,

	Hans
