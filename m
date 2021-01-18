Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B062F9DAF
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 12:12:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389838AbhARLJ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 06:09:57 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:50813 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389955AbhARLJs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 06:09:48 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 1SP3lI8g1yutM1SP6lYRWv; Mon, 18 Jan 2021 12:09:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610968140; bh=rmBkZbqdwxLdkFjkZ/f6SmjjYIeJdSfxgcigdYZNOOU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=IyLcDjwAglHK4V+qofEPMkwe6OufUd21Y5RWO0hmkEF7PSuPxTD18A8E0hsUHdtyI
         5NzApNSlOEeDS7o+nYV8QbGrxrk/fw6Hrfszhh7eFAXLCxh2IWmng7SSPx7vuT/3Xm
         FJW7PZDqS6PuqfbEc6tB9kVLUwYmdr5JAIv0imbXx/VR7DzboSE14XfnA8+4xQxbiV
         K5VBFWEZ7rSDABtWIjynoUH70KU62Jo9t7bNttXUswzzV9mkFBpnBCt+wCMEFPb9tx
         hqnjJOcoz+74LiIJUKA3jX5EWQxGYETQ7aR++jG3EhETHqFEn+wxyTG47AzqqDCdZq
         m3gxiJsmgfhEQ==
Subject: Re: [PATCH v6 0/4] Fix the rkisp1 userspace API for later IP versions
To:     Heiko Stuebner <heiko@sntech.de>, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, linux-media@vger.kernel.org,
        mchehab@kernel.org, Laurent.pinchart@ideasonboard.com
Cc:     linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
        christoph.muellner@theobroma-systems.com, tfiga@chromium.org
References: <20210118110448.275389-1-heiko@sntech.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e98a2c06-c04c-567b-643a-d785988820a2@xs4all.nl>
Date:   Mon, 18 Jan 2021 12:08:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118110448.275389-1-heiko@sntech.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfII0tMi/5pQVAk60iSd0DAkBYyPNyAgjCNbJGKGv/hJNOYlomEjCrjg18hOD6XWYI/FpmTWYhw5LKKNRIbxwmyN+BwlD/XEliY//UeXMWCAlKXwcvVsl
 tiJCezYYqNGGRXlpgh/+LqbssdutfLZrKGkyIPyKzbXV3KlGzvjgJ7oDsQRvzzyLJNcOqSw17cq+0XGT2ns2Tguh2csmqEriUax5S11Lurzg+/85bteLwfXU
 lfR8hUmdIBB6gskQIaUA/X1yGnDdmR5ILuDTyg9VCc7E9yI1PLnvQMxNdg59REvcyR3YQPZpmVwTNdMViAMfyDTxzFNR27lzTo10FuZBBbuwIMjMnxdyfRb3
 XKa9tc7Clv5ZZoOekYCOpsaG5WDa/kvZey9uHJviav9SUxLfl5ersBiysi6fG+zZaP8hOyayR2f261xu4e/7SYjLffJ71qYqimm6tgNqyt9vfLdGoSrWCCfc
 180Q8X+UOFvfuHpfRLxsguHlaw+NiTzZ+r1qGolWeVBzMIh8t9lPVIEZhlNg55ELYB9eAm11LjGTBBxOJsouVaiIBvouoN9qnjWkAg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/01/2021 12:04, Heiko Stuebner wrote:
> This NEEDs to go into 5.11 while we can still adapt the uapi
> during its RC-cycle.
> 
> 
> When looking into supporting the rkisp1 of the px30 I noticed that
> some fields got bigger in the uapi, caused by bigger number of samples
> for example for histograms or gamma values.
> 
> The rkisp1 was destaged with 5.11-rc1 so we have still time during
> the 5.11 cycle to fix that without big hassles.
> 
> This was discussed previously in a mail [0] and a rfc series [1]
> and this two-part series now splits out the important parts that
> really should become part of a 5.11-rc and thus the final 5.11.

Nice! If there are no more comments, then I plan a PR for 5.11 on Wednesday.

Regards,

	Hans

> 
> changes since v5:
> - move grid reduction for V10 to separate patch (Hans)
> - fix commit message (histogram size 28 -> 25) in patch4 (Hans)
> 
> changes since v4:
> - set GAMMA_OUT to the real 25 instead of the 28 with 3 spares (Dafna)
> - start RKISP_Vxx enum with 10 for RKISP_V10 to make output
>   easier and also allow userspace to differentiate between old (= 0)
>   and newer driver variants (Dafna, Laurent)
> 
> changes since v3:
> - add patch fixing the original histogram size comment
> - make comments in uapi more verbose (Hans)
> - fix wording in admin guide (Hans)
> - document version <-> soc in uapi as well (easier for people) (Dafna)
> 
> changes since v2:
> - actually zero the correct sizes for u16 values (hist-bins)
>   (kernel-test-robot)
> 
> changes since v1:
> - drop duplicate isp_ver storage, hw_revision is enough (Dafna)
> - document multiple maximum sizes in uapi (Hans)
> - document usage of hw_revision field (Hans)
> - zero fields transmitted to userspace before adding data (Hans)
> - use _V10 field sizes when filling fields, as there is only v10 for now
> 
> changes since rfc:
> - move rkisp1_version enum into uapo
> - show version in media-api hw_revision
> - introduce constants for versions and make max use the biggest
> 
> 
> Heiko Stuebner (4):
>   media: rockchip: rkisp1: fix comment about number of histogram
>     sub-windows
>   media: rockchip: rkisp1: reduce number of histogram grid elements in
>     uapi
>   media: rockchip: rkisp1: carry ip version information
>   media: rockchip: rkisp1: extend uapi array sizes
> 
>  Documentation/admin-guide/media/rkisp1.rst    | 16 ++++
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 21 +++---
>  .../platform/rockchip/rkisp1/rkisp1-params.c  |  2 +-
>  .../platform/rockchip/rkisp1/rkisp1-stats.c   | 12 ++-
>  include/uapi/linux/rkisp1-config.h            | 75 +++++++++++++++++--
>  5 files changed, 106 insertions(+), 20 deletions(-)
> 

