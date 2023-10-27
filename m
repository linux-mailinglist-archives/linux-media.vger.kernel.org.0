Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 333217D9C31
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 16:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345974AbjJ0Oww (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 10:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345833AbjJ0Owv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 10:52:51 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3AE512A;
        Fri, 27 Oct 2023 07:52:48 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (185-9-10-242.cust.suomicom.net [185.9.10.242])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4SH5Hd4F4vz49Q1r;
        Fri, 27 Oct 2023 17:52:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1698418365;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Y15Jv92bgf6UrS2zddTrUWZ2/E9b4t0NylsOBftby+Q=;
        b=GQNg5PrNps4HRc2TwGUm95odRNxD0p0dAYg2qIehWTt08oHwG4gQ8H0jVRLlGvPdthkrfc
        ZZw8fe6pef5m/H7mhF6+SsSuMnWfYMLQCpkWPCx5qlT3f0YQphY2lo0vddPmOtoojV7QV5
        RPHyvn9misPHd7rOjjcowlnt1DeIuFSXaZed7T2NfXT3O4HTjW+8d0qfldJIARjXPfI+9G
        cvIIGoY66lHlt6FW3gL00vi/BPMUNbtW6nAF6TNMTWzY5OnL00CXmvy3BoWcUzx7/npTP/
        QZ0dZ9rCrwcpgj4YKPJX4kQ94Lfw++DsrNVBxhsNJ3kCgAxHVfnMa9r0xH5RMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1698418365;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Y15Jv92bgf6UrS2zddTrUWZ2/E9b4t0NylsOBftby+Q=;
        b=ggQiNt4yc3WtyW/0P5ld9jD5bg7MOmapvtjdAPyf1UaIbG0z+FNEUljxYNR24GpzloxDbE
        2SlscGbDGWoJb7anrsYmw12gD2Afn8d3VijmNI1i07Jjg0cj0PDc8ltQUtQ/d9qwrD/y0f
        y8vFiUXpr6bOmTBRO1Akqa+SA/CeQy4RChXJqTDYfr9nxRaP8J2NcoSmewmhcQ7upWndmF
        1Pg14SKgjRxdgfDZYftaGB7O/zxX6hDOkYjD8gpr57FG8ycVjpQKH77P+w28uNylVx+RXu
        2wZnYEGkOpC7bN19QQ6hME0enW2WSiXBCBOl2902uMRLFjQYANu3KAXR+MJ5Gw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1698418365; a=rsa-sha256;
        cv=none;
        b=DfM/s+hwFYET7uNgxTaAkEeyvTFqJ51KKQ9n++yLaGLc8r/IP7yJfS9HI5bcqPlqNitCWX
        GlfNqoFMGQ+j+kVa5VTLCGWSc84Rk4pC4aN493aLXt9kkVkCxt0OIg1TBZioKnMFikNdnq
        PiJGJL2XnhV38DOkk8ollvupj2yi5cY3UOTyEED18UIVznzax1GFNyEqqC2oq0RoIo0qti
        XXYTn7GZO7TLwnHYLomzvE+1Gqmmi2br4IaXNGfI9cFLAt0f+HwbexFUueP7peJzWdmGUK
        A5p9a24VMXb4hM3bi51gIgew0069aDOheDuNg9+fOrYyNSZ9bNwrRgqemvwn1w==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id BCC7F634C93;
        Fri, 27 Oct 2023 17:52:38 +0300 (EEST)
Date:   Fri, 27 Oct 2023 14:52:38 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Julien Stephan <jstephan@baylibre.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: media: Add bindings for THine
 THP7312 ISP
Message-ID: <ZTvOtnbRrykdr7oW@valkosipuli.retiisi.eu>
References: <20231017132103.9914-1-laurent.pinchart@ideasonboard.com>
 <20231017132103.9914-2-laurent.pinchart@ideasonboard.com>
 <ZTulSCwfyEF9exu9@valkosipuli.retiisi.eu>
 <20231027121929.GC12144@pendragon.ideasonboard.com>
 <ZTuueXYFeEqqpD6Z@valkosipuli.retiisi.eu>
 <20231027124634.GB19539@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027124634.GB19539@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Oct 27, 2023 at 03:46:34PM +0300, Laurent Pinchart wrote:
> > > > > +  port:
> > > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > +    additionalProperties: false
> > > > > +
> > > > > +    properties:
> > > > > +      endpoint:
> > > > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > > > +        unevaluatedProperties: false
> > > > > +
> > > > > +        properties:
> > > > > +          data-lanes:
> > > > > +            description:
> > > > > +              This property is for lane reordering between the THP7312 and the
> > > > > +              SoC. The sensor supports either two-lane, or four-lane operation.
> > > > > +              If this property is omitted four-lane operation is assumed. For
> > > > > +              two-lane operation the property must be set to <1 2>.
> > > > 
> > > > How are link frequencies determined by the device?
> > > 
> > > The link frequency is not under direct control of the host. There are
> > > registers to select between mode presets, each of them producing a
> > > particular link frequency.
> > 
> > If they are known, one could only allow setting the modes with known-good
> > link requencies. This could be added later on, too, affecting systems with
> > link-frequencies set. I guess you could also add it now, as optional.
> 
> I vote for later :-)
> 
> > Where's the link frequency information available? In documentation or in
> > on the firmware API?
> 
> In the documentation (which is not public I'm afraid).

Could you add this information in the driver?

Co-incidentally, the driver is lacking the LINK_FREQ control. It should be
added.

-- 
Regards,

Sakari Ailus
