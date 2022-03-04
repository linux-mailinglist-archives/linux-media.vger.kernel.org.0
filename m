Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 680DE4CCA94
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 01:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231668AbiCDAKy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Mar 2022 19:10:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbiCDAKx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Mar 2022 19:10:53 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC43F3EABB
        for <linux-media@vger.kernel.org>; Thu,  3 Mar 2022 16:10:03 -0800 (PST)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id C52461B001E8;
        Fri,  4 Mar 2022 02:09:57 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1646352597;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0sk+gKdBbPeiN9rO5Gk5RhEzhWIHzVcDSSjHo7mY0QI=;
        b=dgli5mMw94Mc+kpj8UQ3BVPqYcZJ7qH99//MyT5kDNqPjEHYw0dkUHMPWCnOEpnIh2VJv5
        Pva5LBXfUlw2nLNUv76AS+xL7xL62m8CsxG4fr2FwuXQwV4V+2d7bI3Qk++eLZsvQ7BtVp
        lRb6x2/D54e/nt06vRO9jRcR/oQ6NbmzTYB7iHiZMt8Jav/3BJHlbewqABcEQ5JAaMcuRr
        phi9lIgmqrz/ZthcfJQvubPmA8phYyK+4jkNlDEmaWdG7Dx1uAKoA9YXx7ns+U/d64xQN+
        IcL1ycehrKbqtEIbE9zwjnw6JqRPCGCV4SqD7f70XprSmbVdwXzk3hRn03SGbg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4DA0D634C90;
        Fri,  4 Mar 2022 02:09:57 +0200 (EET)
Date:   Fri, 4 Mar 2022 02:09:57 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 00/27] media: ov5640: Rework the clock tree
 programming for MIPI
Message-ID: <YiFY1UGvVHTEeVVu@valkosipuli.retiisi.eu>
References: <20220224094313.233347-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220224094313.233347-1-jacopo@jmondi.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1646352597; a=rsa-sha256;
        cv=none;
        b=PqeTMm9Bc3ddH25RvM3Jgx6xys1NngWCNfqlEh1SJ2qByBTOVCJ4GygSFD+fz95dq3dkwb
        EyKEHhk+14G+mEfNw7pH9IVcjR6AEX7Cgxj/gr27GT7vnrJJo2n9bW7owIEt3Et92gdn1P
        /XwY6wRtd1cCAGuP2O1cukQ6W/LBuec5dAnFpKNL3TINAuF9SVv7LBr0O4gbyvoBg8Gyil
        UNpvGRVEfvKQjBdzwy54c2rnu7BR+BLCTPHgT3SuPZ/nxUsTaXaT7qFP00+AfzoSsa8Z56
        J75E5c9Bqtwuq1fivP12s6gIRylDyXIYgSpnClTePsFCJMTIqJTxqRRa0NgYZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1646352597;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0sk+gKdBbPeiN9rO5Gk5RhEzhWIHzVcDSSjHo7mY0QI=;
        b=QbDmmyY03M1exKNP91QORNe4m9v5Bn7MxUpjMeJvz8klhE1+PApfX4HLJMjEoGOzeVV0Tp
        sXpCBk/CcaCGbcnMtjrL7vpYcQS/lSG65kf9+pHNOyOdfudY5+d40u1aJVn642mM7kCHPf
        PjgErfYqHJOHMtS8UhxpjlUyzYo2TjB/XLQIa2WZ45nwYC26RIp0XCRiAY/aRKcRGsshda
        iMHdP5nU/gUYg/1Zy7C0bBkKzKRKqAPeghu74RpbjZAKShRv/DYH56LH2U+2gOFS2tGTzN
        AQahDewDgiQPS1f49dyCiOpc5e3ZDEJAm/SbfmrxV8GdKTfaQzRhA0KjtyeTIA==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello folks,

On Thu, Feb 24, 2022 at 10:42:46AM +0100, Jacopo Mondi wrote:
> A branch for testing based on the most recent media-master is available at
> https://git.sr.ht/~jmondi_/linux #jmondi/media-master/ov5640-v5

The set has been around for quite some time without tangible functional
changes, please do let me know if you have concerns merging it.

Thanks.

-- 
Sakari Ailus
