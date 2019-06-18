Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37DD84A81D
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 19:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730170AbfFRRQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 13:16:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58244 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729435AbfFRRQe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 13:16:34 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BEE3D5;
        Tue, 18 Jun 2019 19:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560878192;
        bh=E/HQT6ZaPECsCmb6zueLeNg2JfU+PD4FczJWgE8X30Y=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EdOgxHSjtVfWuTKg75i7v/3JOgHHLykkmMdoPF+FWOYN6mJFPRhz7bmcy1xEJsPrk
         /Lirs9CQMw23q07mE+7dIgaLE8KEVrErcHYnIJkIYdjN7BRMN4QNTf9wJf6yN7LWh4
         jmKxNFKeO4tZDYTHw9JuB5S+4okRxMQ0F4vnJ/sM=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v3 00/10] drm: rcar-du: Rework CRTC and groups for atomic
 commits
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 sbsRB8KNNvVXBOVNwko86rQqF9drZuw=
Organization: Ideas on Board
Message-ID: <f138fab6-49ae-5cb5-10b0-1de4b314ea99@ideasonboard.com>
Date:   Tue, 18 Jun 2019 18:16:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 17/06/2019 22:09, Laurent Pinchart wrote:
> Hello everybody,
> 
> This patch series refactors atomic commit tail handling in the R-Car DU
> driver to simplify the code flow, and open the door to further
> optimisations. It takes over Kieran's "[PATCH v2 0/6] drm: rcar-du:
> Rework CRTC and groups for atomic commits" and "[RFC PATCH 0/3] VSP1/DU
> atomic interface changes" series.

Thanks for getting this series ready for integration.

For the changes made to patches originally authored by me:
  Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

For your new patches, see those patches directly.
 (One is reviewed, and one is not fully reviewed yet).


For the whole series:
  Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Including testing specifically against a previously reported modetest
failure from the test teams which is now functioning correctly.
Interestingly my connector id's seem to have incremented. I'm not sure
why yet...

As discussed, it could be due to the group changes.

--
Kieran


> The R-Car DU is a bit of a strange beast, with support for up to four
> CRTCs that share resources in groups of two CRTCs. Depending on the
> generation, planes can be shared (on Gen 1 and Gen 2), and output
> routing configuration is also handled at the group level to some extent.
> Furthermore, many configuration parameters, especially those related to
> routing or clock handling, require the whole group to be restarted to
> take effect, even when the parameter itself affects a single CRTC only.
> 
> This hardware architecture is difficult to handle properly on the
> software side, and has resulted in group usage being reference-counted
> while CRTC usage only tracks the enabled state. Calls are then
> unbalanced and difficult to trace, especially for the configuration of
> output routing, and implementation of new shared resources is hindered.
> This patch series aims at solving this problem.
> 
> The series starts with 4 patches that touch the API between the DU and
> VSP drivers. It became apparent that we need to split the configuration
> of the VSP to allow fine grain control of setting the mode configuration
> and enabling/disabling of the pipeline. To support the cross-component
> API, the new interface is added in patch 01/10, including an
> implementation of vsp1_du_setup_lif() to support the transition. Patch
> 02/10 prepares for the new call flow that will call the atomic flush
> handler before enabling the pipeline. The DRM usage is adapted in patch
> 03/10, before the call is removed entirely in patch 04/10.
> 
> The next two patches convert CRTC clock handling and initial setup,
> potentially called from both the CRTC .atomic_begin() and
> .atomic_enable() operations, to a simpler code flow controlled by the
> commit tail handler. Patch 05/10 takes the CRTCs out of standby and put
> them back in standby respectively at the beginning and end of the commit
> tail handler, based on the CRTC atomic state instead of state
> information stored in the custom rcar_du_crtc structure. Patch 06/10
> then performs a similar change for the CRTC mode setting configuration.
> 
> Finally, the last four patches introduce a DRM private object for the
> CRTC groups, along with an associated state. Patch 07/10 adds a helper
> macro to easily iterate over CRTC groups, and patch 08/10 adds the group
> private objects and empty states. Patches 09/10 and 10/10 respectively
> move the group setup and routing configuration under control of the
> commit tail handler, simplifying the configuration and moving state
> information from driver structures to state structures.
> 
> More refactoring is expected, with plane assignment being moved to group
> states, and group restart being optimised to avoid flickering. Better
> configuration of pixel clocks could also be implemented on top of this
> series.
> 
> The whole series has been tested on M3-N and D3 boards with the DU test
> suite (http://git.ideasonboard.com/renesas/kms-tests.git). Additional
> tests have been developed and bugs in existing tests fixed, with patches
> being posted to the linux-renesas-soc@vger.kernel.org mailing list that
> will be integrated in the near future. All individual commits have been
> tested on M3-N, while only key points (after patch 04/10 and patch
> 10/10) have been tested on D3. No failure or change in behaviour has
> been noticed.
> 
> Kieran Bingham (8):
>   media: vsp1: drm: Split vsp1_du_setup_lif()
>   drm: rcar-du: Convert to the new VSP atomic API
>   media: vsp1: drm: Remove vsp1_du_setup_lif()
>   drm: rcar-du: Handle CRTC standby from commit tail handler
>   drm: rcar-du: Handle CRTC configuration from commit tail handler
>   drm: rcar-du: Provide for_each_group helper
>   drm: rcar-du: Create a group state object
>   drm: rcar-du: Perform group setup from the atomic tail handler
> 
> Laurent Pinchart (2):
>   media: vsp1: drm: Don't configure hardware when the pipeline is
>     disabled
>   drm: rcar-du: Centralise routing configuration in commit tail handler
> 
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 168 ++++++-----
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h  |   9 +-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h   |   6 +-
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 377 +++++++++++++++++++-----
>  drivers/gpu/drm/rcar-du/rcar_du_group.h |  44 ++-
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c   |  63 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c |  10 +-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c   |  20 +-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.h   |   2 +
>  drivers/media/platform/vsp1/vsp1_drm.c  | 189 ++++++++----
>  drivers/media/platform/vsp1/vsp1_drm.h  |   2 +
>  include/media/vsp1.h                    |  26 +-
>  12 files changed, 637 insertions(+), 279 deletions(-)
> 

-- 
Regards
--
Kieran
