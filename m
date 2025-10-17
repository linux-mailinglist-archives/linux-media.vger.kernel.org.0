Return-Path: <linux-media+bounces-44838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A641BE731F
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 10:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DFF519C14C0
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 08:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332262D0627;
	Fri, 17 Oct 2025 08:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="KX+ZM8tE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B2E2C11C9
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 08:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760690064; cv=none; b=TBDAZsNKXkypeL7nQVwyECwnEF5IZ3QrE8+0gQKp7qxG7h7TzxQpeCLJJmb/a9mG50auMvWmK+JKr1Zogs1kQsFUwGi1Q9kJzJseEOeFghc9LPTqF0NbjGkqROTOM5vDZ8Vh2DigaCcsKiFUjF/AvDxqfR1eS5VugUeaaHmeXVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760690064; c=relaxed/simple;
	bh=rXUmxrGIqOAJYZ+/gxnEEhhhSgt5g34jwsL9bWpkQsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=He5Uq5Sh7cjIDt05uZviO0Q+9jELb/phx33FhFlJxQnJ8VfGuxY97wNrES7YHWmCyl9RcN0/DZOHx54ftswRjVZQHoxqOD8Ifbe7gGN1JwCqI1gatrPn4rvP5kHts+SS730PS2qIslr13gzz7NKapAZ8S5sbsozWN/WCBddBV5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=KX+ZM8tE; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b550eff972eso1144252a12.3
        for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 01:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1760690061; x=1761294861; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zwWTDPTxdZ8sUmLlagbF37tgnT8oA3Q8eIsLoS6sVgo=;
        b=KX+ZM8tEogSRJD2TpIDLVIrSqbhYcA+vD3yWyhHXavrTPJ50uNXZIF209RF+5KBP+c
         vptBXmy9+ZaTFzLxMP9imLp0+Gk8dYEeYJgw2TSaiuT4rigb8T5zI8XX9Fdnqa7v50RB
         QMT8GLrwlshe3NFEmI07o8sM2RP7JJJuecD4dBNc1tmY0svq+O8R9UU98GVOme67MBr7
         GhPijiTiG7ncbKYQIIQpUJTaIaseHxnicwZj6UvXm3Ygc26j28tCOdHvTL+NuYpcmVjO
         JQ7j4Dr6cQUJisLzwIo0xnaknINYr8Q8aUOx0zSIYRn348vj3YqTWcFYeEQcuhgFNYvv
         whlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760690061; x=1761294861;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zwWTDPTxdZ8sUmLlagbF37tgnT8oA3Q8eIsLoS6sVgo=;
        b=SMVeK3SxftPRODdQo7nsyUU2o9Clju5g18zcxr2awfxYBi8Ell03GCjA/eG7YGWzql
         gtDJpP+0sMP031klILhI1vKzZf9dFyXupdskEHBaT9LhcZ2vae7OegCM6HhK0Oyymo37
         FUTMJE+W8P2yoIF1bFQGAu8yJtKGmU8QmRswvj1n6aMU/uHwLDk6jSeXRFYPOWHSQU9s
         /LvdrkIP+OfUgJwTH6hBhIxZs7LdslOJYd8yGYJWF6RpXIuyZVeqPnO2qImLxQTaQpLi
         Fn1e1/qB8WDGZy9721QQro4Zzx8GBC44URJx1iIbFOLTGsDgDOaXUOcHl0Bj6P/jjDT9
         E7Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVHC2ULkOKxiIDd/xPRXwR07L6RM/ppT+rnpeNbcI38233WU8cHPK9Igtn+em6aK+8h8HbtGP0AchnrqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN/XJqca6Mzbud7aYlIsaFTenESHLdXyU3HzMPHNI1OcI1eqb1
	Ci5UeQhnHeQ4IOv6YsEbACKfWcO5FBPo0bpAYLuLUVSnS0xT0t75u/rUh+PF4IuqM7aD
X-Gm-Gg: ASbGncsHQex4nfJsZAhGjzU0iv5kLP6FgYjXn8v4ACLr6OBIwZ+2/jQa00UlBVnMcgJ
	SML9SN5iIb6ZelFqRep9YsxQn5TZOGkXOWnAkVBWKRwHDDjncBSetxlyn88CTQwS99Fw2muZgdM
	BKbZtG/Vfc9ju1navk9/90oLDNvKMxxQ5nWjPcyuEopFAOVD4ScNkdiVxnho2zZo8rj32e6p6Qu
	A12MtkYeXCEL6uyrYIHTgApAVOh+lHmtVY0oYk189T2XVQ1ixzHfTYUQtenvfje75jsmylsrHmK
	LfjDzgew1potm5Z11xRNDm9kNG3v892UxR7WCPifrXVCGDJ+kE4CMp1EB79tUxkLqocOV8U5pfs
	ARz3YjmFvKmY5geXJgBPrs2gS2a7dFxo6RqLfcQPAGcM5+CEUBwokfEeoWAlvD5P5t6P3hpxIQe
	jWfkhtkNxpHnSv0w==
X-Google-Smtp-Source: AGHT+IEnb6UjQcer/I5Rw31GyT+MdTerRyv2aeOuud+h9gNncxVu01d76QtKrkpwP6x0XkSdMK0XZw==
X-Received: by 2002:a17:902:fc8e:b0:27d:c542:fe25 with SMTP id d9443c01a7336-290cb27c8e8mr37576595ad.41.1760690060687;
        Fri, 17 Oct 2025 01:34:20 -0700 (PDT)
Received: from sultan-box ([142.147.89.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-290a382a927sm51595225ad.106.2025.10.17.01.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:34:20 -0700 (PDT)
Date: Fri, 17 Oct 2025 01:34:16 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, mario.limonciello@amd.com,
	richard.gong@amd.com, anson.tsao@amd.com,
	Alexey Zagorodnikov <xglooom@gmail.com>
Subject: Re: [PATCH v4 5/7] media: platform: amd: isp4 video node and buffers
 handling added
Message-ID: <aPH_iHmPFWTrrOQE@sultan-box>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-6-Bin.Du@amd.com>
 <aNzP2LH0OwUkMtGb@sultan-box>
 <c28eb905-b578-4512-aa9c-37281d3a0ee4@amd.com>
 <51c24e3d-be89-44c9-8247-95fb776aed78@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51c24e3d-be89-44c9-8247-95fb776aed78@amd.com>

On Thu, Oct 16, 2025 at 04:13:47PM +0800, Du, Bin wrote:
> On 10/11/2025 5:30 PM, Du, Bin wrote:
> > On 10/1/2025 2:53 PM, Sultan Alsawaf wrote:
> > > On Thu, Sep 11, 2025 at 06:08:45PM +0800, Bin Du wrote:
> > > > +++ b/drivers/media/platform/amd/isp4/isp4.c
> > > > @@ -178,6 +178,16 @@ static int isp4_capture_probe(struct
> > > > platform_device *pdev)
> > > >           goto err_isp4_deinit;
> > > >       }
> > > > +    ret = media_create_pad_link(&isp_dev->isp_sdev.sdev.entity,
> > > > +                    0, &isp_dev->isp_sdev.isp_vdev.vdev.entity,
> > > > +                    0,
> > > > +                    MEDIA_LNK_FL_ENABLED |
> > > > +                    MEDIA_LNK_FL_IMMUTABLE);
> > > > +    if (ret) {
> > > > +        dev_err(dev, "fail to create pad link %d\n", ret);
> > > > +        goto err_isp4_deinit;
> > > > +    }
> > > > +
> > > 
> > > Two problems with this hunk:
> > > 
> > > 1. According to the comment in include/media/media-device.h [1],
> > >     media_create_pad_link() should be called before
> > > media_device_register():
> > > 
> > >      * So drivers need to first initialize the media device,
> > > register any entity
> > >      * within the media device, create pad to pad links and then
> > > finally register
> > >      * the media device by calling media_device_register() as a
> > > final step.
> > > 
> > > 2. Missing call to media_device_unregister() on error when
> > >     media_create_pad_link() fails.
> > > 
> > > Since the media_create_pad_link() will be moved before
> > > media_device_register(),
> > > we will need to clean up media_create_pad_link() when
> > > media_device_register()
> > > fails.
> > > 
> > > The clean-up function for media_create_pad_link() is
> > > media_device_unregister().
> > > According to the comment for media_device_unregister() [2], it is
> > > safe to call
> > > media_device_unregister() on an unregistered media device that is
> > > initialized
> > > (through media_device_init()).
> > > 
> > > In addition, this made me realize that there's no call to
> > > media_device_cleanup()
> > > in the entire driver too. This is the cleanup function for
> > > media_device_init(),
> > > so it should be called on error and on module unload.
> > > 
> > > To summarize, make the following changes:
> > > 
> > > 1. Move the media_create_pad_link() up, right before
> > > media_device_register().
> > > 
> > > 2. When media_device_register() fails, clean up
> > > media_create_pad_link() by
> > >     calling media_device_unregister().
> > > 
> > > 3. Add a missing call to media_device_cleanup() on error and module
> > > unload to
> > >     clean up media_device_init().
> > > 
> > 
> > Very clear guide, will follow your advice.
> > 
> > > >       platform_set_drvdata(pdev, isp_dev);
> > > >       return 0;
> 
> For 2, we found when media_device_register() fails, calling
> media_device_unregister() won't clean up media_create_pad_link() because it
> simply returns without doing anything(see https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/mc/mc-device.c?h=v6.17-rc7#n797).
> Therefore like other kernel drivers, we'd rather not call
> media_device_unregister() in this scenario, it doesn't cause issues, but
> it's not logically correct. Cleanup for media_create_pad_link() occurs
> during error handling via isp4sd_deinit()->isp4vid_dev_deinit()->vb2_video_unregister_device()->...->media_entity_remove_link().
> What do you think?

Oh, good catch! You are right about media_device_unregister() not cleaning up
media_create_pad_link().

But I don't see how vb2_video_unregister_device() ends up calling
media_entity_remove_links().

It looks like media_create_pad_link() is actually cleaned up via
v4l2_device_unregister_subdev()->media_device_unregister_entity()->__media_device_unregister_entity()->__media_entity_remove_links()

And I mentioned before to add a missing call to v4l2_device_unregister_subdev()
on error, so it looks like that will cover the media_create_pad_link() cleanup
and therefore you don't need to call media_device_unregister() in this scenario.

Does that look correct?

Sultan

