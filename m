Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDE4C7C5DBE
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 21:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233467AbjJKTlU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 15:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233360AbjJKTlT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 15:41:19 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24BD690
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 12:41:18 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (185-9-11-240.cust.suomicom.net [185.9.11.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4S5NRt3ZP2zyY5;
        Wed, 11 Oct 2023 22:41:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1697053274;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mCwgnwN4oBDy/LzHIPOmF4zyVHdU88MAUh0Nf+SfOiU=;
        b=Rby0ybgm6+e+8YZvCQw3eB+9Am4IQSo9iOE3p8NKATC8ymyKcu53xFlnO3mbOSQJ1pwlpi
        EDDrWBT1o+pfjbaBw2n9uIv2Y+5lw28oIxO3PiUM2YlOjfYaZze7YiECt1KrEhusnAdwfD
        HjxaP9Zs5Zky26ZglfD7XGrVQPKpMrY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1697053274;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mCwgnwN4oBDy/LzHIPOmF4zyVHdU88MAUh0Nf+SfOiU=;
        b=CAH82Il6sTlTxaoiRx+l95YVtjPh6dTbDkn4wC3AXC2a3Zd1l0bjg4eoZMIRd+/nw9Ucu3
        n1ZqZKgsBk691UwjQEo0gIoM5FiDuQRxWD+zi8vYNtp0Xt3a9Qc+ZX2gogiHcdDmGpJSXr
        s81Wh6V9+OUbbzr+Kw9FWfqKPgncdDs=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1697053274; a=rsa-sha256; cv=none;
        b=vUgqV5649Q1/0aSXVPV89b1fvQKWwihk5WaVYvHmBknlA7nQF7E0vPsPZqmeDMv8ka5qAR
        eBPXNtgDyJp8xS5YUrQIQlpht/qQ48p00odJIMMZZnzZbKxKT9U7sNd/uwtfDrLOraB89V
        X9RIFDz4fF0CMAuAnkhGyj/h1rCKkXg=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 35AB6634CA9;
        Wed, 11 Oct 2023 22:41:11 +0300 (EEST)
Date:   Wed, 11 Oct 2023 19:41:11 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 03/28] media: uapi: Document which mbus format fields
 are valid for metadata
Message-ID: <ZSb6V1VsFxYPuyok@valkosipuli.retiisi.eu>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003115237.76828-4-sakari.ailus@linux.intel.com>
 <4b604381-49af-be89-65dd-d8898a3b6a00@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b604381-49af-be89-65dd-d8898a3b6a00@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 05, 2023 at 02:28:20PM +0300, Tomi Valkeinen wrote:
> On 03/10/2023 14:52, Sakari Ailus wrote:
> > Now that metadata mbus formats have been added, it is necessary to define
> > which fields in struct v4l2_mbus_format are applicable to them (not many).
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   include/uapi/linux/v4l2-mediabus.h | 18 ++++++++++++------
> >   1 file changed, 12 insertions(+), 6 deletions(-)
> > 
> > diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
> > index 6b07b73473b5..3cadb3b58b85 100644
> > --- a/include/uapi/linux/v4l2-mediabus.h
> > +++ b/include/uapi/linux/v4l2-mediabus.h
> > @@ -19,12 +19,18 @@
> >    * @width:	image width
> >    * @height:	image height
> >    * @code:	data format code (from enum v4l2_mbus_pixelcode)
> > - * @field:	used interlacing type (from enum v4l2_field)
> > - * @colorspace:	colorspace of the data (from enum v4l2_colorspace)
> > - * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding)
> > - * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding)
> > - * @quantization: quantization of the data (from enum v4l2_quantization)
> > - * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func)
> > + * @field:	used interlacing type (from enum v4l2_field), not applicable
> > + *		to metadata mbus codes
> 
> This one does say "zero", like the others do. Is that on purpose? Annoyingly
> V4L2_FIELD_NONE is 1, not 0, but perhaps zeroing this would still be best?

I'll document this being zero as the others.

> 
> > + * @colorspace:	colorspace of the data (from enum v4l2_colorspace), zero on
> > + *		metadata mbus codes
> > + * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding), zero
> > + *		on metadata mbus codes
> > + * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding), zero on
> > + *		metadata mbus codes
> > + * @quantization: quantization of the data (from enum v4l2_quantization), zero
> > + *		on metadata mbus codes
> > + * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func), zero
> > + *		on metadata mbus codes
> >    * @flags:	flags (V4L2_MBUS_FRAMEFMT_*)
> >    * @reserved:  reserved bytes that can be later used
> >    */
> 

-- 
Sakari Ailus
