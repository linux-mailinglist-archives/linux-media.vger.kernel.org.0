Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9228D6A036E
	for <lists+linux-media@lfdr.de>; Thu, 23 Feb 2023 08:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233312AbjBWH52 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Feb 2023 02:57:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233228AbjBWH51 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Feb 2023 02:57:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D82C104
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 23:57:25 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A460E4DE;
        Thu, 23 Feb 2023 08:57:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677139042;
        bh=elEYcgy0MHwThaflGLDmfRuEH4bTGWY5sW78iPmGbSY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=NGQzG8gVQFDWBcDu6M7TSiXn1cZ9Y2EklafPH64BcdGd+bzU1EAB0jRHq+z4trlpn
         EQ0rDhUgTXZ6zYRoPlwTyamLZ9bJMgxF5Ol0b7LcpJxpQYTyziXKoxAm53fWiIH2jB
         g291PWbuhnIfcJprXDDWIgH63VAw+DXsBk+og1aU=
Message-ID: <c7d1eb15-6374-a5d6-7198-666ce56a9528@ideasonboard.com>
Date:   Thu, 23 Feb 2023 09:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [v4l-utils] [PATCH v9 0/7] Switch build system to meson
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com,
        ariel@vanguardiasur.com.ar, ezequiel@vanguardiasur.com.ar
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/02/2023 16:31, Laurent Pinchart wrote:
> Hello everybody,
> 
> This series is the latest (and greatest) attempt to switch v4l-utils
> from autotools to meson.
> 
> Compared to v8, minor review comments have been taken into account (see
> the detailed changelog in patch 3/7 for more information), and a build
> breakage when cross-compiling due to incorrect handling of config.h has
> been fixed. Better handling of config.h is also included in patch 7/7,
> on top of the removal of autotools support.
> 
> As far as I can tell, meson support is now ready. I can address review
> comments in a v10 if there are any, but I'd like to merge it soon to
> avoid another painful rebase. I'll be available to fix issues on top if
> any problem is encountered later.

This doesn't apply to the very latest master, but applies with a bit 
older. Works for me.

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

