Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F32B1C6972
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 08:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbgEFGxm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 02:53:42 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:36493 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725782AbgEFGxm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 02:53:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id WDvzjnD9u8hmdWDw2jBezh; Wed, 06 May 2020 08:53:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588748019; bh=Ddl4ba8z2sdkFORjy6VpZX0NiuD+njlkCF/5UPTFDhQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YdKKR/zFlVMl6PdQNI+Dz8Rbn1g7xsA5evWTPTtt1jiu54MRUrlAg2m+KYMxeSHyy
         mXIiIfzm7gwfuQHU+0VzIEVF4OXRIBPf9Qi7YuKevqRW0jTsKMHs5cgS8IYgWWffPM
         P5X+3WSljeKOZpZQgV1nQPmZj13LABeW5teoJ6xyErG+t5wMXWj6ngQjUYu2j0NSQq
         dsUEi82QVqCu6huemIrzJ6vOGkSWlQrZ5Ewzi0JtywujZBJcZqCr8G32ZH2iO56ZjK
         pNdI0HDGkLifgsVmxK9z4NlJuKqNfMG5BB/ARbwf33qGeJ82BvcA7AtvCewwmURnWD
         /akEXcAHM1Xmw==
Subject: Re: [RFC PATCH v12 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588645920-20557-1-git-send-email-skomatineni@nvidia.com>
 <1588645920-20557-7-git-send-email-skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e4a5c68b-4856-175f-5d02-06dc4a038b00@xs4all.nl>
Date:   Wed, 6 May 2020 08:53:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1588645920-20557-7-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEX9ydVl7E+s7YONC63NHL4RtUlk0vpw7gHw/qvWvWz35D5FYSom7dt9UFaUAIfdPFX8sRJ0HiyPLTtK5e/ObCadkslhnRDwHBvi9T1SNxOF96nJN/Am
 IW/x2eWW5iZMNib74/ndHPt58VApCxK0K2e7iiX9pwkJqXS3WxrOjKgL9OjrrDiKx9AOylCxAHqbY1jCXZZXYGaZyyyCpDlUnG6GxRXaD1W8tJBvwM5X5tyv
 SHCxAXtDl3BXOot+PeDAHOl8oNh9epL+EHZIdNGZ3rhpolf8uLCydnKXrXpdo5dt4tQTUr88ukcQuJ7NNwcfvAgUHC11qKElGJCEC/FDy7ZmEahvOL6WWa63
 wuffyJq3CSltos3h7/54WkLRR971dheZyeQqyQaiAZPUh4AQ5PNIsjMkbnHKAOhuLFpDulUNYwuhyq5vweZyXJsR5WaOI/6Q6cQjg7+zvSWEzCsQ4/VzWwki
 OinvMOOb9SBSel5gULKfYRs+rxkoMQFhpAHwNhJ1saxNvZZnX1Hc0/fEmKrdWXyGV7IKvOBpeqPOW1Yrlk8RmqZBZPfavg3Pf5jt6XSK+NRVk4qOICgTXVdu
 U+rXYmyVvU87pBkgaUsS+5wV
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/05/2020 04:31, Sowjanya Komatineni wrote:
> Tegra210 contains a powerful Video Input (VI) hardware controller
> which can support up to 6 MIPI CSI camera sensors.
> 
> Each Tegra CSI port can be one-to-one mapped to VI channel and can
> capture from an external camera sensor connected to CSI or from
> built-in test pattern generator.
> 
> Tegra210 supports built-in test pattern generator from CSI to VI.
> 
> This patch adds a v4l2 capture driver with media interface for
> Tegra210 built-in CSI to VI test pattern generator.
> 
> This patch includes TPG support only and all the video pipeline
> configuration happens through the video device node.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Since this goes through Thierry:

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans
