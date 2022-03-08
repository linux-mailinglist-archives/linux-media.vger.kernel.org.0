Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BAEB4D16FF
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 13:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346733AbiCHMPE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 07:15:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237459AbiCHMPC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 07:15:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE92419B9
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 04:14:06 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCF11488;
        Tue,  8 Mar 2022 13:14:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646741645;
        bh=cp9new5L1lG9283IQsS9fdbpD0V3aXIWRmt4tjxShJo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Au8BZSWNeHRRoKDBhQKOWqMpsObRHgULiBFB0MSyzSMBaoTWCuskP5Ve9wU6P9sre
         ZwH3RoF6YP63kiz5CzASgU9DeUHzBsLDCl/LnortqOsmU4iY2vDozFttIBfTb8l/8I
         kYO2xcXHcSNl6eauZRzwUZx4diTertCEsK1fHxos=
Date:   Tue, 8 Mar 2022 14:13:51 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Arec Kao <arec.kao@intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        andy.yeh@intel.com, tfiga@google.com
Subject: Re: [PATCH 2/2] Re-run BLC when gain change
Message-ID: <YidIf40ZReGpa+M5@pendragon.ideasonboard.com>
References: <20220308033839.3773-1-arec.kao@intel.com>
 <20220308033839.3773-2-arec.kao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220308033839.3773-2-arec.kao@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arec,

Thank you for the patch.

On Tue, Mar 08, 2022 at 11:38:39AM +0800, Arec Kao wrote:
> Changing the gain affects the black-level through the device;
> the gain should therefore not be changed during a BLC procedure.
> If the gain changes, then the BLC routine should be re-run
> in some scenarios.
> 
> Signed-off-by: Arec Kao <arec.kao@intel.com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-image-source.rst       | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index 71f23f131f97..5ee53ba76d46 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -59,6 +59,11 @@ Image Source Control IDs
>      non-sensitive.
>      This control is required for automatic calibration of sensors/cameras.
>  
> +``V4L2_CID_BLC (integer)``
> +    Changing the gain affects the black-level through the device; the gain
> +    should therefore not be changed during a BLC procedure. If the gain
> +    changes, the BLC routine should be re-run in some scenarios.

This doesn't tell me what the control does.

> +
>  .. c:type:: v4l2_area
>  
>  .. flat-table:: struct v4l2_area

-- 
Regards,

Laurent Pinchart
