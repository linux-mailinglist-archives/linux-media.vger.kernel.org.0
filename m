Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2002720753E
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 16:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404104AbgFXOF1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 10:05:27 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:47155 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2403979AbgFXOF0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 10:05:26 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id o61YjhdaJNb6lo61bjteBB; Wed, 24 Jun 2020 16:05:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593007524; bh=dw3Eb9DNrn57rtG9YdOCtS050/pWz57l02vO/UovmfM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LOIhf43fUMhLbbRFlljdl6k2ddPrRuEx8zOI6fC07B0RkDPz3q2sZpy9CeZae0nDP
         lJY2lJMpiqgKwGLhaH9teNe2J/6eorrbDl5FG266QptduYUAFOJMeufHV65U0+v9Am
         9XHnJqtJl+oin6i0IvXf7qaAKHZdmZq4ja7alnFS7LLne/iuOIsl+3ulz2bGWSHa8F
         H4HVCSkkS2QjewDyaRZ/AGwPSby/vlKFlYjf3uObB0nesdeHwsTg/Wgr2T3cK89SrZ
         vH4YGR+sH3EreslOvdBdhRCgPJlTnMdlQCxTz6DTuAm/kYu87L5h5DdT44HlpqSCCr
         k4HaYg0bJtYHA==
Subject: Re: [PATCH v2 0/2] Refactor MDP driver and add dummy component driver
To:     Eizan Miyamoto <eizan@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20200506084039.249977-1-eizan@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <25cbac25-035f-9c2b-24ec-f59403b56424@xs4all.nl>
Date:   Wed, 24 Jun 2020 16:05:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200506084039.249977-1-eizan@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfI225FoZyJey/ygju+xVYRSghI0nrxerTOVe6pw6CA6Aj2ZwDjSKkpi553ekjV882HSZNRgfLZ01pfpNqq/GzcSW1xcR1hxASBW6Rqb4jE5ZN46TcJp+
 nEvWRCOOFwRv2AlgO9D+Tvlmmu2bFwCI+lzTxBnWzyTCs2ct8Zg+iTGbu6XNyTgLsDBOITING/HQzv2nk8CQN1yoG2hjeRMzSEPhNha4OeIcbkFNV6Hp1yv1
 o5Nd8iz1OEfV2NsmegRcuFA0c/QWM9t/E4Y+j1JRvwYRU1oQdChFKwn1TTp29JVQcwLoEhwlstAJyyMr1zE1IecGx4WdD7oW0zRpExcP60fpJvQBTkR3P4Bq
 mz9hGk32U25EguUQ7Oz5X/2iM29lafXL3nc0vcXE6njTHtobOl+Re1kC/74M5pwr+CMRuRIBMOsRcW+pvSPMWCxalKG1QFWZrE5OXsdskH8ap2eD+aQXYj7T
 nrH4s37tPQnk8T5WjHkL52/d5y0Y4u/dCf6aWlTRxpH6IzjYxAFm3/6Xi21uHKzHIe58eigD9KJbkVLAukXcjJiC6IF/rlDg7wjOlvQNaZHOmhsyNyyz1nOK
 nkY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/05/2020 10:40, Eizan Miyamoto wrote:
> 
> This series depends on all changes in the series:
> https://patchwork.kernel.org/patch/11530275/

I plan on merging the v3 of this series.

> 
> We are adding a dummy MDP component driver so that all the components
> are properly configured with IOMMUs and LARBs. This is required for
> us to get hardware video decode working in 4.19, and possibly newer
> kernels.

What is the status of this series?

There was some discussion with Enric, but that didn't come to a conclusion,
I think.

Regards,

	Hans

> 
> Changes in v2:
> - remove empty mtk_mdp_comp_init
> - update documentation for enum mtk_mdp_comp_type
> - remove comma after last element of mtk_mdp_comp_driver_dt_match
> 
> Eizan Miyamoto (2):
>   [media] mtk-mdp: add driver to probe mdp components
>   [media] mtk-mdp: use pm_runtime in MDP component driver
> 
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 172 ++++++++++++++---
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  32 +--
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 182 ++++++++++++------
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   1 +
>  4 files changed, 286 insertions(+), 101 deletions(-)
> 

