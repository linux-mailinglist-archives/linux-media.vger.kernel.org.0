Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC2B573D4B
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 21:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbiGMTlH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 15:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiGMTlG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 15:41:06 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70EE193C3
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 12:41:04 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 6CC431B0029D;
        Wed, 13 Jul 2022 22:41:02 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1657741262;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Dt1kJe+cDb2VsyjtZz67DIqEdwITK+Gr6eHeuuseOkY=;
        b=dbcB3DVRopUurlIq4HoYNanoxVuiPOtOn6lxQ4R0Z7JC89AYQ8ZqU5yxDE7fx6YrvEz9a5
        wkNNmtEgXoMwEfMAYhk9gCF9V+nCoHMYc+CH1KepRSEfTTxFUsYDaNbmWp/+IFPXEFBoPQ
        LI5ButLsuADgeQwyCiMKHCtuhLo+i3wtoO1IyOZcIbi6H7jsL/irKlwa9dK7pRq1NBc5D5
        8xQT5FvQrEkjusyS87kyd4VVkltmJCpMs3653QJN7CPqvwODwYb0T5lszs9Cr2gplB3wi7
        rrBRc+UdoDytuqQ1klHsjq891hEGGrfue+lZPtgL+6D72CtLT335xtMjplbl5Q==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 22EC5634D5F;
        Wed, 13 Jul 2022 22:41:02 +0300 (EEST)
Date:   Wed, 13 Jul 2022 22:41:01 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] v4l: Kconfig: Drop subdev API option help text
Message-ID: <Ys8fzV1H8iFwqoHA@valkosipuli.retiisi.eu>
References: <20220713173920.222394-1-sakari.ailus@linux.intel.com>
 <Ys8GxF91rx32ZRAX@pendragon.ideasonboard.com>
 <Ys8d54l85k8Cwxne@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ys8d54l85k8Cwxne@pendragon.ideasonboard.com>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1657741262; a=rsa-sha256;
        cv=none;
        b=b/Vvhl/0qdB9SR//9iRdG2JJijbuzhkIyStEUygnwBhkj0IEC9U71ti2Yk6FvvKyqk/6dv
        kNRQROXncpM9Ana+nMzpiDxw/qrCQTjBKkaclVsNIvCgImKQs22je6MqZIeSqzG23ZC0L2
        KM4Z/ajX5lQ691S0P74+zNs1kDTWykm6nRcm0N5BDGFUiH9J9v16mC728lgXSNBTUWtV9A
        6Skelz5flDvNFx6YIxW4JaKXJrlz606SJ7tDZAHu11Nts/gbz/zZgDC8H5Hg9S5WU9Tq+O
        yH63rKPLqWobeusWwE+iNCsw+riLpSEWXq1Dnkgwxn2ONgKGHJk3iPM5K41ahQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1657741262;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Dt1kJe+cDb2VsyjtZz67DIqEdwITK+Gr6eHeuuseOkY=;
        b=Bd+jF84ncFdgDte2s5N6NSROo5mFNvhYQCIRzTpy/ug3avgdEs/tTPQ4QK6lwmX0h46JEu
        kc0/7M1pgul2tkvKYe96sYSeL8D6KIkjxL/8Y0W1oaHB7fJo5Yftk/5tq7MjwrSuZy7J8E
        VVldgL55d6O22qHdMukGMBguRCKBvRbXBRCKQR9yqEcsuksjhswmp2lz33OZRm3r5BJfaz
        XFm0aYv2aMentfIEgHyuxv1+Vd2H98EdzjUerXIHQ40CVFhY/m+RY7WzuQ9peNSCESCVrV
        zvPDoZn9n+4SkWZwOPU4TWdiSQh7oik8DnCB+gvK5cUBE07uav54uneEDjjsEw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 13, 2022 at 10:32:55PM +0300, Laurent Pinchart wrote:
> On Wed, Jul 13, 2022 at 08:54:12PM +0300, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> > 
> > On Wed, Jul 13, 2022 at 08:39:20PM +0300, Sakari Ailus wrote:
> > > The config option text was recently removed, also remove the help text.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Actually, on second thought, isn't it useful to keep the help text as
> documentation ?

We haven't generally done that for other such options either. This was
intended for end users IMO.

-- 
Sakari Ailus
