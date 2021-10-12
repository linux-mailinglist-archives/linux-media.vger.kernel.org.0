Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3784D42ADD3
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 22:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234687AbhJLUcM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 16:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233308AbhJLUcH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 16:32:07 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E662FC061745;
        Tue, 12 Oct 2021 13:30:05 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 1390E1B000E5;
        Tue, 12 Oct 2021 23:30:02 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1634070602;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5BeTqxU2tuCzwC78oNi5R6K+v6fdklNFj2d/0XcPbR0=;
        b=IVqOLMmaw/yB1KRguzY4U6cLAmOe3Iitlnn1vXaAqgPbaUf/B4gs5gpB3PSmcnbpXT+gAM
        t6EC1M421Fw8+rSo0mw7fA5NBW8iVbmrywo+BCzzeFsuG5LviSQlP65RZReBlJWUSVpo/X
        9igrTvNO8Si0K+WmldyecApKBUzwuRHHOWLtffox5ELRyjcOM1zen12huhlSrMqgzOVVva
        gUXCh49HH7FFmp4xV08nYb6ecXbYJPEL//n0kEw9D56PBTKRXgGJU+vPmTkzDCEeHDGsuO
        fyHZ7iuIpAKUSPXH+MEOz4FDoj3vgLr/ec3H8LrZ2wN2r8LrmNoE1IuD1NSerg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 46723634C90;
        Tue, 12 Oct 2021 23:30:01 +0300 (EEST)
Date:   Tue, 12 Oct 2021 23:30:00 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
Message-ID: <YWXwSAm3OO/WTkOL@valkosipuli.retiisi.eu>
References: <m3fstfoexa.fsf@t19.piap.pl>
 <20211009102446.jrvrdr7whtd2rv4z@uno.localdomain>
 <m3mtnflpna.fsf@t19.piap.pl>
 <20211011143420.vm6ncl5gdv44nsn3@uno.localdomain>
 <m3a6jel9ce.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3a6jel9ce.fsf@t19.piap.pl>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1634070602; a=rsa-sha256;
        cv=none;
        b=pYuGKFQjZO3IAe5G6WaOKEi/KNw/4uPQ8WDmLUNFmK+lTVRQ6GWaI2TwAFRsk4GDhfnRDd
        Xezagpd7dudZti9Zr+gH2BNO0c5C108+ffCP7wdEDc/H+WkXry5ENA610Hl5JtfbnNXkum
        qseRqeaUvWct3IvdI36CnrilUsBy3PmhvQTwSQVr5jj7xQ/259tuAz+5Qxp7UNeUG6ffEh
        V090BLAnt0ArUMN8ZcoIlbWt/jlQw5d1NYvwcqFm/fMFm3LoEGjMrglj+L1FuUPAGKmhFX
        35bZuz8yTkPfy/GL+IRI6rA5/AU0oCgOzFTI7QSFsdpdTGb01Goj1cv3GehKNQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1634070602;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5BeTqxU2tuCzwC78oNi5R6K+v6fdklNFj2d/0XcPbR0=;
        b=BHreCLVohgrtNfn39GHj8c8le+62JHSOpl62LuRKJjo0mSTipZPovIWoVvo38FHnB6XvUa
        HKiLnqEVQFpT2e4yLLvQhm5WPeU1Qwef7Gp2W9azE88nD9YjxhyulGADKLVMsxpQ3PEQ6M
        GPY3fJ676z8wwNYaS0Zz394Bo3OT4yvmSiZr+uZFSozAn6r0GMywIZgctcEi4RuODT+CCL
        BeV0wQIZHVh9ogbwur0mxnp/rS5e7z/uT8LTaeXusDxtuBT8EPSvHor2rJQSU511V8upri
        WFs/l7cRrM47MA1nd4NIcCgcuKZGO4SlQ1vjDstx7vULRE3XS849IEZMQ5to1g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Tue, Oct 12, 2021 at 02:24:17PM +0200, Krzysztof Hałasa wrote:
> Jacopo,
> 
> > I'll pretend I haven't read this not to be dragged in tangential
> > discussions. My whole point was such a commit message is useless as I
> > assume if you submit a driver for inclusion you have tested it.
> 
> Fine, I will remove that very commit comment.
> 
> > I think the clock rate should be assigned in DTS and you should verify
> > it falls in the supported clock ranges.
> 
> Which driver does that, please?
> clk_set_rate() appears to be used by multiple drivers, I was thinking
> I can use it.
> I can see clock frequencies in DTS, but they usually refer to fixed
> clocks (e.g. crystal-based). The clock I use is IMX6QDL_CLK_CKO, some
> sort of a shared generic clock from inside of the CPU. I don't know if
> I could even set its frequency in DTS.

Please see:

	https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html

Generally camera sensor drivers that set the clock in drivers themselves
are (very) old.

-- 
Regards,

Sakari Ailus
