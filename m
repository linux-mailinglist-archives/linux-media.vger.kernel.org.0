Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFA7A277834
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 20:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbgIXSEC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 14:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgIXSEC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 14:04:02 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F243C0613CE
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 11:04:02 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id w2so323065wmi.1
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 11:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NZUqV6Bvzd8cGlLiOqTGcuZ1Yef+3Qfd3N7B6yq5MdA=;
        b=HB2Z7wdE+cy1f1BINbMce7aOoq/uiu1TMnlcSs9JQDre4pgVVzO6fdURIEYL6hrLNo
         5/wIatPv3/aPCtjtNm033NNIiRbiqrOnzOENMUWs1pt0zSxlB7K2+EQD3a7BhmZb0/jI
         SC0/Yv55lCa605Gfww5F6gCt2rf6u6qGyc5WltCIuGLVIloM+iIFih7Znq7Znz0gVNwg
         9gpmacAJRU7YnapRhXS/qASNua3g9xSm1/LOgoj9CznLwjPNN/duVoIRAWZOWELTwSZU
         qrw8Mk1WbhDZW3G11MFQo2cq4Xpu0Yj5oaANHWvCZAsLR/YsBGeqtTymAHIApAEUtvqL
         1ZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NZUqV6Bvzd8cGlLiOqTGcuZ1Yef+3Qfd3N7B6yq5MdA=;
        b=dewgssNfnQRyBe4L4nG3sV7upyta7yFk9x9moj8nHKn6uS4prrRslLDYwMTBKfPSv2
         uJWgCSB3V/29WVppp3NMJjI1mwTtmw64t7LZVZy/JwHrOdT1PTq5KSNPYbTut921xmDv
         Aq8b8puSQji8SUfXc07o7QpH+HiZcLftvNHXw7eHdBhngluFTHtFGTWuLMfePtSJsyxq
         BziwEbKPO812yXntnnoKFQN/WC27g6yywLTSwSv1YPnKDyjOAM+ZGMOIPcO4jC3Il0yz
         77aJtO0RzVM7kKfnqy1e26aIbfmqEOAW53qAnPTdwg5j1bBJrNpMpQAjKKE21Zw3Iq8i
         ItNw==
X-Gm-Message-State: AOAM532Wq22MtYytFtLNfP0a4Srmsm2tERVs43O+KusIAMKQONr7hb7f
        OleIxolpaO60qmZvnYI1eRs76g==
X-Google-Smtp-Source: ABdhPJxgdbm5WtFN36J7bm9N5ZXswxOvraqE3+QPtP6NridZqs70Eg1VUO0GwuKYSQ84Q+b1z4edDw==
X-Received: by 2002:a1c:a987:: with SMTP id s129mr406580wme.38.1600970641058;
        Thu, 24 Sep 2020 11:04:01 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id n66sm94350wmb.35.2020.09.24.11.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 11:04:00 -0700 (PDT)
Date:   Thu, 24 Sep 2020 20:03:58 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH RFT/RFC 37/49] staging: media: zoran: add fallthrough
 keyword
Message-ID: <20200924180358.GA26916@Red>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
 <1600683624-5863-38-git-send-email-clabbe@baylibre.com>
 <20200921105945.GC4282@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921105945.GC4282@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 21, 2020 at 01:59:45PM +0300, Dan Carpenter wrote:
> On Mon, Sep 21, 2020 at 10:20:12AM +0000, Corentin Labbe wrote:
> > This patch adds fallthrough keyword where appropriate.
> > 
> > Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> > ---
> >  drivers/staging/media/zoran/zoran_device.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
> > index 9558bafdde7d..7634d94f9359 100644
> > --- a/drivers/staging/media/zoran/zoran_device.c
> > +++ b/drivers/staging/media/zoran/zoran_device.c
> > @@ -268,7 +268,9 @@ static void zr36057_adjust_vfe(struct zoran *zr, enum zoran_codec_mode mode)
> >  		btwrite(reg, ZR36057_VFEHCR);
> >  		break;
> >  	case BUZ_MODE_MOTION_COMPRESS:
> > +		fallthrough;
> >  	case BUZ_MODE_IDLE:
> > +		fallthrough;
> >  	default:
> 
> Hopefully, we don't need fallthrough labels for empty switch statements
> like this?
> 

I have removed this patch and nothing warn about fallthrough missing.
But this is strange, if I have added them, it is because something (checkpatch ?) complained.

Anyway, nothing complains now, it is cleaner without them.

Thanks
