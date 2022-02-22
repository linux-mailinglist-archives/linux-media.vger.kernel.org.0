Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78D114BF9B5
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 14:44:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232515AbiBVNoV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 08:44:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbiBVNoU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 08:44:20 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4691E11E3E3
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 05:43:55 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id B8D0E1B001CF;
        Tue, 22 Feb 2022 15:43:51 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1645537431;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fK94qH8PbH8TMSl+Kin7HAg5J4JoE9osb9VB5BOh5G8=;
        b=giDopx3XT0Imk5qSIHPHUzFtCza4yHIPc5WXto6zVLetJvi4qRCNZtVhvUiy3dffkEuT5Q
        3eBvAZOLfuoOX+lpPzxMuxDSGW9fKqcbt1ZuuBdWGe7Q3Y699th0NC8SMCQBmWJdGghapj
        dY75tE2gTViDHCvcpR7NjK8/1tY/xpc5ZxRUTDME4+eZWDTmHVt8uadptVIx9E6DGIoQzA
        RlbNmeoKEA2pKJuIpi1M6lpe65yOsL27uVYdWD2HhUR/DE14ysG2XcMlsTKdZjHwlrhr0x
        Vad+amuOUzq1JW/IgqH3IheIVSHkAKa+ge/35J5GHTUhsFgLkwl3pJBpfNYEgA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 18047634C90;
        Tue, 22 Feb 2022 15:43:51 +0200 (EET)
Date:   Tue, 22 Feb 2022 15:43:50 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     aford173@gmail.com, slongerbeam@gmail.com, p.zabel@pengutronix.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, martin.kepplinger@puri.sm,
        rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
        alexander.stein@ew.tq-group.com, dorota.czaplejewicz@puri.sm,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/7] media: imx: Destage imx7-mipi-csis
Message-ID: <YhTollrt4S+3qBAR@valkosipuli.retiisi.eu>
References: <20220221174727.320320-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221174727.320320-1-jacopo@jmondi.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1645537431; a=rsa-sha256;
        cv=none;
        b=LaRmXEho9daIUkstILlb06jldQ2ccmoHDSxE1pj7/o3L0mKPeRfDf6Qg9FmMbQddd883OF
        YgOsmCxc24H6SVAmZStIcr/a1q7rJHLyTyXlNrdqwHmNlyJ0J5qHPp4VOwL7c9Zp39dR2a
        jjmqyY7iHbTa9cVnvvGXHRYg/V872FbNw4dhSk6ifUQiKa9dS4Sry37BbBPKt17Za1GqBv
        3cbwlUfGsNh/kJdVwv01dkHcHMmT1bznhn8TLOWl1c0o66FLNy08ZR+vHjaQqROvkJgYbu
        wZAlLBLIbcW/Ejw+s8vk5thFeRgBM7enwWC9et/wGv3xwyPzfcUwzRRoqEKKyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1645537431;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fK94qH8PbH8TMSl+Kin7HAg5J4JoE9osb9VB5BOh5G8=;
        b=s3DxnXhwQpa7ZvTQi4cacTwjeuQp+pwmqHK8vDA1eiM59VYLhDGhveUUzQSGEPJXHiFvv5
        7T2sRREJYJVHyHe24LfhhxWV84F2OiPIqpy7+Oo9VAtWN6dWRS4VOgu/21LaxKMGAZOgC8
        tbCS0cT7G99qcb7jI2jaeN+02tj3J4Rz8H+XD+w8/aWF+ju8QvC0fiyH7p2I63b2PUDFJy
        Lyabw5EYhz8nZI/W8kW65EBtn6VEeeuNevmV0DlgDpwrd0vNEf6VR8jnfdTzuUGdNAAyAy
        Hr1w1+En/qXrT12sxppR4YcKwMfmxhEzqiDOwaOBt/A1o3pETkmUDtpKUjtZ6w==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Feb 21, 2022 at 06:47:20PM +0100, Jacopo Mondi wrote:
> Very few variations from the recent v3, just reflowed some text and dropped
> a plural name in 6/7 commit message.
> 
> Jacopo Mondi (7):
>   media: imx: De-stage imx7-mipi-csis
>   media: imx: Rename imx7-mipi-csis.c to imx-mipi-csis.c
>   media: imx: imx7-media-csi: Use dual sampling for YUV 1X16
>   media: imx: imx-mipi-csis: Set PIXEL_MODE for YUV422
>   media: imx: imx-mipi-csis: Add RGB565_1X16
>   media: imx: imx-mipi-csis: Add BGR888
>   media: imx: imx-mipi-csis: Add output format

Thanks for the set.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
