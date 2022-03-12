Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6BEA4D7147
	for <lists+linux-media@lfdr.de>; Sat, 12 Mar 2022 23:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbiCLWVS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Mar 2022 17:21:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbiCLWVS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Mar 2022 17:21:18 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C977114FC8
        for <linux-media@vger.kernel.org>; Sat, 12 Mar 2022 14:20:12 -0800 (PST)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 913211B00120;
        Sun, 13 Mar 2022 00:20:10 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1647123610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Q5BN0rtxBwmS1MN2YZdGnvZ+cHARBaKYqcvcMI9n4oA=;
        b=FIZYn7j9Ht2Soy0LYS4o62vwpbx7F465L7GR+W4/KT7xqMVUz9UcQ6cN2IUL9N1r1kvFZ0
        /Ys/SKcOSxC0KFyxPv6XR3sOYMU1g6YbV0kDhSkQa+k7djgnii9SbsDhD4IQm3GG4ILdRB
        5cfIzh6OoQ0S124Z5oyxEdqgiDoUczoCjBNY//hsz+1zIOziHom7KBOo2GnW9buJFteQ21
        x/9Q1vGr4GjYAC8npHKw3cnU5byWdmDfLZlW43ZEH0MHn1OtYi72Qh/a14cbEEXI9JXtK9
        T93moDXha+TbIjV9qcX9uIU/N5h9Q3QoGueX8XEXDNCpgSZ1QXXZQtQ4s/66uA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 40485634C93;
        Sun, 13 Mar 2022 00:20:10 +0200 (EET)
Date:   Sun, 13 Mar 2022 00:20:10 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH 4/4] media: imx: imx-mipi-csis: Simplify runtime PM
 implementation
Message-ID: <Yi0cmjHAjUH1VS6Q@valkosipuli.retiisi.eu>
References: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
 <20220311135535.30108-5-laurent.pinchart@ideasonboard.com>
 <Yi0cP9pJTQSUFRAp@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yi0cP9pJTQSUFRAp@valkosipuli.retiisi.eu>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1647123610; a=rsa-sha256;
        cv=none;
        b=QllOn3DhDc57Yc1TOrBIDJj/2nQ24yDW85TcqQu0ZWeL6bd/cKMu6z3t8gcB9TTdCvdzfD
        dhwCkzgysfu899hwdwxPNt1vWtd7gwk3P/vUHFOg/L2cB2rCdL51g/2jr17SEpQvKks19Y
        WRo2wQeynQ6v6gqGyv6uNtWee8p77mcH8cRyz9Frf4R3oMTendlTGPt4Vn3o9pGDkS63eO
        5+oon1WqyIw1eXhAOhf9v7guNOHKcyBYiu2FzYVjAczuoWrzSIEmII7DhEHP4hC8lhS3id
        iBxpjwtjYGp298vXGLWHhsEuJSMXK62h8j7SN1CwihR9dIuo9OOVnK9oBQc/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1647123610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Q5BN0rtxBwmS1MN2YZdGnvZ+cHARBaKYqcvcMI9n4oA=;
        b=SbcopRLq0LpaFTgIEsVjwjT1CIKgZXfjLJ4UCn2cO4Q+gkR4Z83ERnZKO2firlqOoYZ9wy
        no7Gb3HMFcNHUqaD3ym/2DcjGEwQcxz5KfbwyjaqHXiZcENpgfoC82+6YPXz6Gg0mzipTX
        /YvZ3fLbBzTxU+GK05OLWLGxEpVbUkXMk+U/dP/6Jz7YEw2jc0HbBUUVRpkZ38jpvWo+fy
        UQCS71IBeqIoZzbBRURmr8zyOrXyyYK8akAW9wzlrI0gVozW/oQCyPEQxaodWHp52f8hCS
        bV01ATOOBMyF9pzWrLA41MkpqvMhKU+ZARA5UdtdxmOtdOpXByFkizCrHMSuEg==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Mar 13, 2022 at 12:18:39AM +0200, Sakari Ailus wrote:
> > @@ -1193,7 +1189,7 @@ static int mipi_csis_log_status(struct v4l2_subdev *sd)
> >  
> >  	mutex_lock(&csis->lock);
> >  	mipi_csis_log_counters(csis, true);
> > -	if (csis->debug.enable && (csis->state & ST_POWERED))
> > +	if (csis->debug.enable && csis->powered)
> 
> Could you use instead pm_runtime_get_if_active() instead? You could then
> drop the field.

Ah, I see Jacopo already posted a patch to do that. Feel free to ignore.

-- 
Sakari Ailus
