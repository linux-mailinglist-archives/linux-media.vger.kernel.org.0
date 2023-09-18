Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE3A47A4195
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 08:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238411AbjIRG4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 02:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239894AbjIRG4C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 02:56:02 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211ECC6
        for <linux-media@vger.kernel.org>; Sun, 17 Sep 2023 23:55:57 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4RpwYQ1Ybbz49Q2q;
        Mon, 18 Sep 2023 09:55:54 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1695020154;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OCyoyYZIhCurSerSpS+ioX084yv3P7vBf42CS4pV61c=;
        b=Vv549+Wj8urvCAZS81/JUufi3BSRryIAdsSGoUDYXCplIcg2FzErlBKgMCBSA6KyYyEvyF
        +YUxUANSWQqJy0XH/XPBfyCMvH5yITO5npHYf2RA5zpsw2Qo2S9yjF2mbwOMOrRfjl4ZUu
        zoUJgBWLhk7dmQmw0p9DVO16lGYjeMdexxp51aHeiHu9VH5UBJ72zz/2Xp6FG7deEeVCGX
        biTSLoCdWl3jJ6+u88y07cOc3xkzO+hSet1VknW27YZQVPrJXR1Q7prsV8Fx7yyxtpOqp+
        a1NylAm9coiicxsSLdA50gu58qM6qrE911Yd0N7haFzHGBPYfqbnn3Fe97lOAg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1695020154; a=rsa-sha256;
        cv=none;
        b=YHY5FTPtRxoEj/Z6tYYWhky5Ui1kkrhMSfMT1ijC2TaO0hIpFBv6MQ0XC513ZN5Dt4dxkg
        iSkhktLmWqUQM+Mpxg6vxYvgfZY9qhaY7j21fqJ4iCSq5ibb4PQZcJYD8oAf4Zu2ZnN2KQ
        VreUvts7FDHu1MwHndUbIDwbVkzYoKuU/cLNu83q3kR7Vj8RSc1dDs5SvubxOhbuiMNjNr
        43Fw+PPOP6q4yJ/TNDABcM6gvShl/2qWPoCQ3bpOOSe4kz+GSB7dCOt26P/srYluVSnaZa
        2zYe/jCeWJh9VcjTwYeuRA3G4cvtHr16b32epKJBBken78uH1Ssx31R/R4v8Ig==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1695020154;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OCyoyYZIhCurSerSpS+ioX084yv3P7vBf42CS4pV61c=;
        b=SxJDaUe1BvzVmSmH0vvZtQoSH8qB7vp1F2XOFG4yBe89JJzJDG/xuAF1l303s1/1Lzzkxm
        PzybaYu6HGcQjPAfLrmkh+C6zGt6Uxh1RMa7aVVjzo7C0VbVFLEHh55R8tCyiizsj03skd
        SB0zNM1hcZcaj68DZKrXFkN1faBDU2g2nmlN04OmGTBgKQYH5DJOvsl/BeFh4jKaUMlkNd
        rpXgNdru2YgZzmcOHDWFWDqDlc/Dq3LjFkjGMiQiS1lIMVD0BeKVotqLYqZVoNVliVD0QF
        mStt55bytEyPEf6pxTQqUVGeUus6aDn2/qsAl650JW0xQIXKZ0/0k1/SD7SPIw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B22CF634C93;
        Mon, 18 Sep 2023 09:55:53 +0300 (EEST)
Date:   Mon, 18 Sep 2023 06:55:53 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Mikhail Rudenko <mike.rudenko@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 22/57] media: i2c: ov4689: Drop check for reentrant
 .s_stream()
Message-ID: <ZQf0eS+uu6ot1Z6+@valkosipuli.retiisi.eu>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
 <20230914181704.4811-23-laurent.pinchart@ideasonboard.com>
 <87jzsrut4i.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzsrut4i.fsf@gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mikhail, Laurent,

On Fri, Sep 15, 2023 at 10:26:28PM +0300, Mikhail Rudenko wrote:
> 
> On 2023-09-14 at 21:16 +03, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> 
> > The subdev .s_stream() operation shall not be called to start streaming
> > on an already started subdev, or stop streaming on a stopped subdev.
> > Remove the check that guards against that condition.
> >
> > The streaming field of the driver's private structure is now unused,
> > drop it as well.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/ov4689.c | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
> > index fda217d2cb10..cd8d7131e747 100644
> > --- a/drivers/media/i2c/ov4689.c
> > +++ b/drivers/media/i2c/ov4689.c
> > @@ -100,7 +100,6 @@ struct ov4689 {
> >  	u32 clock_rate;
> >
> >  	struct mutex mutex; /* lock to protect streaming, ctrls and cur_mode */
> > -	bool streaming;
> 
> We can now drop the mention of "streaming" from the comment one line
> above. Aside from that,

I'll remove that while applying.

> 
> Reviewed-by: Mikhail Rudenko <mike.rudenko@gmail.com>

Thanks!

> 
> >  	struct v4l2_ctrl_handler ctrl_handler;
> >  	struct v4l2_ctrl *exposure;
> >
> > @@ -468,10 +467,6 @@ static int ov4689_s_stream(struct v4l2_subdev *sd, int on)
> >
> >  	mutex_lock(&ov4689->mutex);
> >
> > -	on = !!on;
> > -	if (on == ov4689->streaming)
> > -		goto unlock_and_return;
> > -
> >  	if (on) {
> >  		ret = pm_runtime_resume_and_get(&client->dev);
> >  		if (ret < 0)
> > @@ -504,8 +499,6 @@ static int ov4689_s_stream(struct v4l2_subdev *sd, int on)
> >  		pm_runtime_put(&client->dev);
> >  	}
> >
> > -	ov4689->streaming = on;
> > -
> >  unlock_and_return:
> >  	mutex_unlock(&ov4689->mutex);
> 
> 
> --
> Best regards,
> Mikhail Rudenko

-- 
Sakari Ailus
