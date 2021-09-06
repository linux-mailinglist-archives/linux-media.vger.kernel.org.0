Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34751401757
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 09:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240186AbhIFHyu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 03:54:50 -0400
Received: from meesny.iki.fi ([195.140.195.201]:43772 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240166AbhIFHyt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Sep 2021 03:54:49 -0400
Received: from hillosipuli.retiisi.eu (89-27-100-251.bb.dnainternet.fi [89.27.100.251])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id F16B1201A8;
        Mon,  6 Sep 2021 10:53:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1630914823;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dl04EcBEovB0z67bJJd0IcCsfjvcm4H5nKTPh9ieLzw=;
        b=YVLA4GBqSRyTSpUY7ume0bLAofYSq0800w/Lt0pEjYeNfSmbMcbGk6TdZGJGRSUI3d1v38
        isEKy+BWyjSm6p5DhTyWdBD9MSt96n5PGl1NWELeHYlDIlHiCwaVxgcH9XKNszIAW3irX8
        etqy8qtMTKBrG0NexfciOOoi17gNN4A=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4134D634C8D;
        Mon,  6 Sep 2021 10:53:42 +0300 (EEST)
Date:   Mon, 6 Sep 2021 10:53:41 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Martin Kepplinger <martin.kepplinger@puri.sm>,
        devicetree@vger.kernel.org, kernel@puri.sm,
        krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, phone-devel@vger.kernel.org,
        robh@kernel.org, shawnx.tu@intel.com
Subject: Re: [PATCH v8 3/4] media: i2c: add driver for the SK Hynix Hi-846 8M
 pixel camera
Message-ID: <YTXJBYb2EzR9iIzx@valkosipuli.retiisi.eu>
References: <20210831134344.1673318-1-martin.kepplinger@puri.sm>
 <20210831134344.1673318-4-martin.kepplinger@puri.sm>
 <20210903161742.GD2209@bug>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903161742.GD2209@bug>
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1630914823; a=rsa-sha256; cv=none;
        b=ognmFP0waEVCmTO3zE3mhMVI1xR6yBzs6GkZToIu68SkGCCqI4EblTDAeKo2Ga4HJMSO36
        h9MX/Q2zbLq6tL8GTNkA71+9fVg+Wxi+6ZKDonYwx1Er+DsCG9pMvXdTAS+Ul0FyYcqz/0
        dpPGDXLiU+PpdHQPeflU0AR+IA7C6Ac=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1630914823;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dl04EcBEovB0z67bJJd0IcCsfjvcm4H5nKTPh9ieLzw=;
        b=k3UT4FMT+0+VuZr74rUWguYh8Csfl8zq+ll+Hs4vOoBMhatglEeti+kpc9Nx5d14J+tCea
        JglDzfh8fFmBlf0w2ZgLt1v02wcqU2ACeQNfywDBXolfiOdqlJee5nocPyRSKznh06nWfD
        OOeBg6+nwJ406Nfsc3ud09Ort9i7UWQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pavel, Martin,

On Fri, Sep 03, 2021 at 06:17:43PM +0200, Pavel Machek wrote:
> > +static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&hi846->sd);
> > +	u8 buf[6];
> > +	int ret;
> > +
> > +	if (*err < 0)
> > +		return;
> > +
> > +	put_unaligned_be16(reg, buf);
> > +	put_unaligned_be32(val << 8 * 2, buf + 2);
> 
> Is that obfuscated way of saying put_unaligned_be16(val, buf+2); buf[3] = 0; buf[4] = 0; ?

Good catch.

The buf should be only four u8's long, and you should use 16-bit variant
here, too.

Also the transfer should be done on sizeof(buf), not 4 (which indeed is the
same, but cleaner).

-- 
Regards,

Sakari Ailus
