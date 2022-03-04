Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB4FB4CD07D
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 09:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbiCDIxC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 03:53:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235102AbiCDIwz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 03:52:55 -0500
X-Greylist: delayed 31326 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 04 Mar 2022 00:52:08 PST
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131F619DEB2
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 00:52:07 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 910F91B002FC;
        Fri,  4 Mar 2022 10:52:05 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1646383926;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FVpK6DBqusWtUrSWGHUogRKqzlW/neEgzOugrO84sAw=;
        b=FpgEOtkjpTlszK/4LlBkYPvezgdhPlDLqZ5kR9obw14DUmmG5Y2hmH6mLpdYGTSFj9c7tZ
        ZS9GFlOpe6aduYR/sH3oMjPMQWIrEeyRj/RLNGab9ePm4PW9/gDqj0PepZxqOGVC4zNDES
        d6TwzLONt5sfsEfX0qa6pELT1uAByBoqf1G4feBiWTKPoUDO3Rbjm+IfZ7gdzZFfCRnwwP
        BTICc3l5VK4lS3wI5zSta+2WImdiaqvB1Tb79g/OeTnADkvZ9AOuJKMUEcazIBjum2Ocqe
        cSossc3msAvN6mMGWMhMXEWt9/XVA0MYNuDY5F80Yhz+q7dOEuW9Ih6w3JfjYA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 54081634C90;
        Fri,  4 Mar 2022 10:52:04 +0200 (EET)
Date:   Fri, 4 Mar 2022 10:52:04 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Eugen.Hristev@microchip.com, slongerbeam@gmail.com,
        laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 00/27] media: ov5640: Rework the clock tree
 programming for MIPI
Message-ID: <YiHTNOTlEZAftfJs@valkosipuli.retiisi.eu>
References: <20220224094313.233347-1-jacopo@jmondi.org>
 <YiFY1UGvVHTEeVVu@valkosipuli.retiisi.eu>
 <6462a1b5-3a8d-7d6f-d8ae-85a751805866@microchip.com>
 <20220304084529.52s34emzctcuthly@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304084529.52s34emzctcuthly@uno.localdomain>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1646383926; a=rsa-sha256;
        cv=none;
        b=sUbRdYMwpHr7mHlIX3cYhXZXfWUWiCuL1JCcEXxXgZbl2inNOo/SJ6FkVEt00A5Js+BIxU
        ZnlYVLYFD23aAVutFWsFN8ifOqPXwqEQuSqaB02ETogDeoxTcmBNNerRMO6XIcczjb7Fji
        k3e/lonTq40O+mBtwyfi2nMPO55Naz04chPXPYqVjU0OrLMhPHBxTtND5Q9SeLBjQPOX7i
        lqNY8f2qAd/W8YR4aOA6EJ8hM5gpZfvKmHWcPpym5zy1cH2o90PNkcHVavdvM2MffqwguA
        Vs9JY6A6BCSMJu6xaBMKvzb5Fo3KBMzvkagrC5SYTw8w2mtnHU3CukVZtSpwdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1646383926;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FVpK6DBqusWtUrSWGHUogRKqzlW/neEgzOugrO84sAw=;
        b=a8FA/VZbeNbwmVL0mTfvVyYY9HYzS4zU3QV5UnJPVtxG76t1QrXCp+hxVgQ4IwnEB5aePG
        cVHodTFYoPHIRN2L4ayxgjxCrXP4mS1iJINoXDloNPoNXHtYZB4lgMjGAgAQ8KKUCpFhqq
        LJOCDKE1VWz1QNQfICqFRVtRBK/ArALwGGwQBBjR0Yu5N3wfHbV5J6EZAHmJvapsnHoj60
        xQiQN6ZhdZ3j8gM+bt99Iur+av2f72+M4i8OeXM6n6L5DQRyDSoBfWlQZsDMRzR+ALRl7q
        v74xnS2eeK3kGWd7J2ChrRTq0F+feTATpVYk/zh+xNd38nUStWrl+W5Xpsavcw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 04, 2022 at 09:45:29AM +0100, Jacopo Mondi wrote:
> > Thanks again Jacopo for improving the support for this sensor.
> 
> Thank you for testing with parallel mode, I would have made lot of
> people unhappy otherwise!

Thanks, guys!

Applied to my tree.

-- 
Sakari Ailus
