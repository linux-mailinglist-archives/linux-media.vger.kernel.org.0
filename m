Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0294EA202
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 22:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244791AbiC1Uxw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 16:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345995AbiC1Uws (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 16:52:48 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F19825E8F
        for <linux-media@vger.kernel.org>; Mon, 28 Mar 2022 13:50:43 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id EA08B21121;
        Mon, 28 Mar 2022 23:50:40 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1648500641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tqUyOKqjMEDlCHHSXKZVCEP+UHZgydmGWmHiwoH0XpQ=;
        b=DgBR92DtBTlazsinQ1DrWT3HvXh6V/MTdKGvkxNoOGSDZpffwSp3T0DYvuQfdCh32eSt37
        Q+AlKmTn82zE+mXMXLKP/bDxOK2J/UklJj/QeSy2UHtrM6UN4oOTyyvcGKyAhyH/ljbKf7
        GDHgm5y7DnZTksGtnjanrETlu670f4g=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 51C06634C90;
        Mon, 28 Mar 2022 23:50:40 +0300 (EEST)
Date:   Mon, 28 Mar 2022 23:50:40 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 00/27] media: ov5640: Rework the clock tree
 programming for MIPI
Message-ID: <YkIfoJAGP1xN2bJ3@valkosipuli.retiisi.eu>
References: <20220224094313.233347-1-jacopo@jmondi.org>
 <7c082420-63f4-0520-21a2-7e10a1e2c321@ideasonboard.com>
 <20220323095019.edql22tjb3ea5npx@uno.localdomain>
 <Yjr5axPO2oDMUlKJ@pendragon.ideasonboard.com>
 <20220328145728.r5kz3rj6pddxmnfb@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328145728.r5kz3rj6pddxmnfb@uno.localdomain>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1648500641; a=rsa-sha256; cv=none;
        b=ph0lPzLEGfedb7NnY82SI8MRl+JGzM6NPoSQdcDtaaaif8AZNSl7F+CKi2JBHxsP+L2mv1
        bvngFUojab6WDs5p3+/+bWF8s6cHrK+BPpppwgOTEnhBIzeQUTCVad3/yf70sCcIg1x6dO
        YGe197duI8PGYCP3VV/PkAG6yATJfck=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1648500641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tqUyOKqjMEDlCHHSXKZVCEP+UHZgydmGWmHiwoH0XpQ=;
        b=lrJ4UIL5JUyZ+BK5Ni0nPWQVFCyWkbvHcCUhirSeiWsSzPXUyHPsZc52OY/PU9koaBa/tv
        yCry61MfrGjR1Z5WLTUd1eZ6eso0f2FjnLsQOMwZHbtszbTv8qBcQxzv6+y1C3Xserhkyd
        UyztNTKzG3NsI22GfSIEhcmjur7sptg=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Mar 28, 2022 at 04:57:28PM +0200, Jacopo Mondi wrote:
> (speaking of which: Sakari you have collected the series in one of
> your branches, but it is not part of the media pull request for
> v5.18-rc1. Should I expect this to be post-poned to v5.19 ?)

Yes.

-- 
Sakari Ailus
