Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4B06303234
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 03:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729201AbhAYOFB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 09:05:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729236AbhAYODz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 09:03:55 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E92C06174A
        for <linux-media@vger.kernel.org>; Mon, 25 Jan 2021 06:03:13 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dbd4xkyj7wcfw2k22jcct-3.rev.dnainternet.fi [IPv6:2001:14ba:8f1:3400:fb90:892b:22d6:3885])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4510A1B00258;
        Mon, 25 Jan 2021 16:01:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1611583284;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UausP13LEsLf+YIEEgLyQhDDEzp26zUfrhCoUEIYXcs=;
        b=UKwN5spQvA+O1DavdHNGk2f87vVb4f+c3bZTcoHiW6tNilirDK96ldCzGHVycVyym4e0ZQ
        nNCJ0skyDUnXgDK5pJdhQc5ct82B5fVOZ1ukmzRtW56Sj9H0HFl9HP6ePMKd0FKUOlIaRP
        OZkGx3MMXN8PfUn8D9ekVnRP2+f/slQWekKbmgaaqnxCfJmcTJs07HqSWBAjRfjLoF2vn5
        xMmzXFqxN0RWH6iYmZbOcn1AYaLSQgsRB3uzbOhNed0Z7Fz65mIVHH/xw4MFOud0ZWhiPr
        nmV2pFgAwmRpsjewFWh2MyTxHZf6zcgIyLQXVLhAnOfIjSH6ei97D+/JEDFA/Q==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id DFCE4634C87;
        Mon, 25 Jan 2021 15:59:42 +0200 (EET)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.org.uk)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1l42P8-0005JR-OV; Mon, 25 Jan 2021 15:59:42 +0200
Date:   Mon, 25 Jan 2021 15:59:42 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 07/14] media: marvell-ccic: Use
 v4l2_async_notifier_add_*_subdev
Message-ID: <20210125135942.GH3@valkosipuli.retiisi.org.uk>
References: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
 <20210125132230.6600-7-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125132230.6600-7-sakari.ailus@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1611583284; a=rsa-sha256;
        cv=none;
        b=hE2l6ATrevaYdVarMOleQbfNVlPiDIqOODBLAcaC5KU+/VKskYDUp6dJYC1/fplBlF7rfv
        mV+XG91UYd9D9XNFuvy1um8QFF7+LSEigOBUOQS/V2yPL/JLGFQHiNmlgKEmyye3mBYCEO
        dIQLGZPjayrhSEHtTuELY3nXHGiTJXq+0i5iQCciZDMd//w65Q5XgVtALIylRAOiaU4cpT
        JdUDsztjTXn8uSIc69DUJBlmghS/pf4OYTYQ4xr7ACdJIxjebFRUKZIPesgfiVXXHBPRxw
        6E7MmU4PJSAkmkmjg+mBeqmjo8ApP2umRJaisWlv+A9ZEwZw9BYTvshI/rorNA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1611583284;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UausP13LEsLf+YIEEgLyQhDDEzp26zUfrhCoUEIYXcs=;
        b=Spd9aDxhAEb2ZBBcZGTuEyT7sGqILfnAiFmCkjjCyJ0C2bUjzJhTLW/iihSbsgjOdnb3fT
        37KTCbeApCEfqboWtcc6ItLFq4KpE0s+0QTtxlJ/bS6STQd0mW8o7Vue9B7HQz78ykzb24
        HR3UK41JCkAikoRtYcElHZBerMMSRkw1yjXfSs7LRDrjfF8ICIBJw0bIZ6t/nhW3j8/PHt
        JefJY1S05X+i22ms7SZhpncM3BKY+xlZyQ/nZpf8/vzKkRqUwhJ82VM2KChfdC2ceUl64C
        w/kZDAR/wxeUxC5qOSfaZGuOGfMMEgBBD0cY0Z8J/762hEanc8elADdk4stDAg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 25, 2021 at 03:22:08PM +0200, Sakari Ailus wrote:
> From: Ezequiel Garcia <ezequiel@collabora.com>

Apologies for the spam. Please ignore these... I'll see if the proper v3
set would get through vger.

-- 
Sakari Ailus
