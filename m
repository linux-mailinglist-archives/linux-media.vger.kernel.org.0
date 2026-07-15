Return-Path: <linux-media+bounces-67641-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gqDiC/BSV2o4JQEAu9opvQ
	(envelope-from <linux-media+bounces-67641-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:29:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F90875C7FC
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:29:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=LKKRMplK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67641-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67641-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6329630BAB8E
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 09:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825B4423E93;
	Wed, 15 Jul 2026 09:21:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E1B423783
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 09:21:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107295; cv=pass; b=hWgl3KIZVu2dlAH5VOMFVJ5NJYjemyTW0AI+GM0njoFoMGfptK9vchowyWyHnpRG1+NdEfiryASlOd/42oVc/BWP0PH3/8WKe7skkx84lSDAUJm9oaD8uk4h1i0o5fEnRI083/PdQU+xAbHJXbHH5I70Up0jA90nVQVtyCJkuVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107295; c=relaxed/simple;
	bh=Hd5amGQyf5d7sp4D/OZ6c1BHeDBP0x2XX9BRCpzpK1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ncS7y4aj+g+VIFVJVHbeoVWvE0kweQThFjQW9bXsIuSom0ahcsE5AhpEOVVCNq5G7ZX0x+d5CFVL5lU/WCsC8yIcXhjp9uSEMf9w+5Yx32z+GS7HOmhn85RM59XsLfWnIoLMK5BE5sSJGh2JeXPZnsn5QE9wTVvKuL9e9BJhGEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=LKKRMplK; arc=pass smtp.client-ip=209.85.210.50
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e9f5637634so1127193a34.3
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 02:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784107292; cv=none;
        d=google.com; s=arc-20260327;
        b=DrxG1XEexSd111ote1tfnuC7QFYQkoH1h2xag6wyhgUWY0R07D8eZSG7okwDtfmN5z
         0pmvNYYvhzs/g+AyTrotjigM9mNSEmOc7VV+1YZPeAXVlk42k88TLtdN0Q9ovgwzV2Qi
         huJzAWCXLILISKD/NyKIeXI+lVxk1tvW+WZ7Hkt7S5G/2gZ1zFMBsiRcff+z8YOa09cp
         WFO2BdZUv27tLsFu17Q/P7tYJE28ApntIVtgoibH7rPzWlZnVuzAC362/L2f5XAF1Wb4
         43zc6PySgIncjFbox9C7Pd0zX6/4/8lM+KLs1Um8paVppgxSrjEdnvK7/GrQ50k0uZel
         s0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q13SU6ITtTBdmGlSBxUH2RoASVTqkGnEBShwZvrhOJA=;
        fh=8qElnQpPcDloH88nWRVzggBloHgdIfFRkWddXJ+cJU0=;
        b=r2aFe/kMJp/NOv2P3JV0HoWMc+x8GKNwXkP2zstws/JBYhcbrp8iYWnlUFo+9dFwYg
         2d66+AkmbsDAS1QaW/Ej+JREdfMtzJeCMWsL8/lMk25Mfx722N7xOMmLh8tlX6LVpbFK
         7D/OwYR5ZU+bUixDqbVERSPkydhmF2ji160xn0OJbz3k1GsyQ0AbHQDTpF+kilNyaGGh
         TyhR+C2UwDsSpY9Wcvs2GrMcD+iJXXUm7TAHKwDttOprhHQOLOqgFWadO/iBxiGs99cU
         0EPTr4C1iyPB9wlhQWr8ydGbO6ZNDcn1YclWYsBsi+D2MHVZMCqt//v57LAyId9LL7Ox
         EpIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784107292; x=1784712092; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q13SU6ITtTBdmGlSBxUH2RoASVTqkGnEBShwZvrhOJA=;
        b=LKKRMplKNRXNvFPkIJ3RNyNrOBHt36SCHHZ4ifdiW0t//H1fwVjPv6R02Phhk0nWuv
         X9sZIR4Erm7o+dD3qBiqwnSAsSkzKm0C9E0MmKdw2cKtDv2phUrWoQVvhGroc8GgKVFb
         +GgZasKoG1LK0U6sHRHA2UCwBZY6vY7blZTlUrngdHBzC0womF+ZCxv9tbFyLPew326i
         wZrZ81n7Q7hLs4lYwkXwj037UHNT5V2s+5Vv2y4I9yJVFJ3HHXw4191+gbZdBoJuDZxF
         UrM/FiUvO/YCLe6m4QHknlG4mRPNcMDIV766VRJ947UZttPK9WT2obkDRxNfPB7BeJ2z
         IqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784107292; x=1784712092;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q13SU6ITtTBdmGlSBxUH2RoASVTqkGnEBShwZvrhOJA=;
        b=D2AMIhZba7cm+fSJGdmiVkSYqUoCjOY5Un3MhmoCkM3o9wAgxTOH4vWuel4PEBoz9p
         E5T+wtI705cuWaI4SKTYNnaaph0yRva4WJ3sYTtuO7Y5Kl3I5smz6lZiz6cXH5Y0aXxh
         BIV6CRFdRx5JbFtNv61Hrww4IfYdJx96ANjUY4+Vz1T2AfMXYFvBUvrgqPRhpBAPG9b3
         e8h2im/CyKj02Vyaj2rAtYBs1Ul3izSGvOqnH0ema4LfpfAVjUMrtwqZTK/Yxq/2mUVn
         LoCS4eNnhEtpccti4N7jI4LYP2IO/MOsvFRDzqL+vn6DHGU+zsJvvMBRSsUVdqND6NIh
         BieA==
X-Forwarded-Encrypted: i=1; AHgh+Rr6ne+PIbXkYYVzAPi9ZPEkawD64f5uiGuWXYu0nhFeNf9bl9LhYwxIn1ozpCd0gVAzaxO15ewAdNniWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsMJ9i8PWEBXWCfUVJnaL838cOvnpiHg8B4ChimGle9dCLpkRR
	VVLg3TWXHV+B60zbszAKsxbW8AsJR4ofnD7WchTUJC3TaOrmGu2UwtmMWIdIZ/bdgLP+Fm0q137
	qEfUeab/ESoqbYwueYCQASd2MLCFr75/CYQ9sgK1gvg==
X-Gm-Gg: AfdE7cnTLBl/7YXr4XIFi+9fcXo2/AEGen1HbYHhFM2SW8S8WifVwYGhpRW6w1yHo5T
	WEoJEgZAfnTx6riMSj4TYkfbBLR2xpc2OrGD0q2R4TnkX0G68DYSDwmtO9Z7H0eAVp3Y7uBB6o2
	OBHsNLFtFORkPXwQ1OIWrRcig2y1JeaPwOX0PWSyTmx9XPnGDReqKoLn3NjQZJ4tXLUxMjxUFfn
	E0cC/jtLbNvLrHkmpag8+GiKqRlmgeq8shblS0cJhkeTGxdfa8N78AOz74szDw5XH9i/TcKvEy7
	5yXc66YAF6E6doG/mO1CzzEjfdQMWFgk43nOI1O51ptCW+zlMXRv0LJyYWZay3tur2NDy+Z+Bom
	HNR/BQmLKZH2Fb3eA3iHEtmw=
X-Received: by 2002:a05:6830:710a:b0:7e9:f6ca:e59d with SMTP id
 46e09a7af769-7ec097a2316mr10470988a34.19.1784107292358; Wed, 15 Jul 2026
 02:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
 <20260708-media-imx355-v3-12-9df386a623d7@raspberrypi.com> <alYfNhqYLLP7Ob2m@kekkonen.localdomain>
In-Reply-To: <alYfNhqYLLP7Ob2m@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 10:21:15 +0100
X-Gm-Features: AUfX_my3kG0frO1GrVnJ7ehCBbH7PHfESPzj6OQyX5yeLJHNv31QUmhUkhMWQAk
Message-ID: <CAPY8ntDaA6w44u88hfomYCkbTAiFW14rp2CK0WXGZP+g1+ntrg@mail.gmail.com>
Subject: Re: [PATCH v3 12/20] media: imx355: Use pm_runtime autosuspend_delay
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Acayan <mailingradian@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67641-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,ixit.cz,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,ideasonboard.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:dkim,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F90875C7FC

Hi Sakari

On Tue, 14 Jul 2026 at 12:36, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Wed, Jul 08, 2026 at 03:48:48PM +0100, Dave Stevenson wrote:
> > Avoid powering the sensor up and down unnecessarily by using
> > pm_runtime's autosuspend_delay feature.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx355.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> > index ee1f41a66a0b..f01a1a5ae7c9 100644
> > --- a/drivers/media/i2c/imx355.c
> > +++ b/drivers/media/i2c/imx355.c
> > @@ -1073,7 +1073,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
> >                       goto err_rpm_put;
> >       } else {
> >               imx355_stop_streaming(imx355);
> > -             pm_runtime_put(imx355->dev);
> > +             pm_runtime_put_autosuspend(imx355->dev);
> >       }
> >
> >       /* vflip and hflip cannot change during streaming */
> > @@ -1085,7 +1085,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
> >       return ret;
> >
> >  err_rpm_put:
> > -     pm_runtime_put(imx355->dev);
> > +     pm_runtime_put_autosuspend(imx355->dev);
> >  err_unlock:
> >       mutex_unlock(&imx355->mutex);
> >
> > @@ -1436,6 +1436,8 @@ static int imx355_probe(struct i2c_client *client)
> >       pm_runtime_set_active(imx355->dev);
> >       pm_runtime_enable(imx355->dev);
> >       pm_runtime_idle(imx355->dev);
> > +     pm_runtime_set_autosuspend_delay(imx355->dev, 1000);
> > +     pm_runtime_use_autosuspend(imx355->dev);
>
> I think it'd make sense to do this before calling pm_runtime_idle(),
> wouldn't it?
>
> There's also a pre-existing bug here: if pm_runtime_idle() powers the
> sensor off before calling pm_runtime_disable(), imx355_power_off() will get
> called twice. The easiest fix is to call pm_runtime_idle() only after
> v4l2_async_register_subdev_sensor().
>
> This should be fixed before adding autosuspend support.

Ack, I'll do that.

I'm aiming to have a new revision out tomorrow to address the build
breakage in the middle of the set (I've updated my test frameworks to
catch this in future), and the Sashiko comments that the device-tree
list bot has flagged.

  Dave


> >
> >       ret = v4l2_async_register_subdev_sensor(&imx355->sd);
> >       if (ret < 0)
> > @@ -1446,6 +1448,7 @@ static int imx355_probe(struct i2c_client *client)
> >  error_media_entity_runtime_pm:
> >       pm_runtime_disable(imx355->dev);
> >       pm_runtime_set_suspended(imx355->dev);
> > +     pm_runtime_dont_use_autosuspend(imx355->dev);
> >       media_entity_cleanup(&imx355->sd.entity);
> >
> >  error_handler_free:
> > @@ -1476,6 +1479,8 @@ static void imx355_remove(struct i2c_client *client)
> >               pm_runtime_set_suspended(imx355->dev);
> >       }
> >
> > +     pm_runtime_dont_use_autosuspend(imx355->dev);
> > +
> >       mutex_destroy(&imx355->mutex);
> >  }
> >
> >
>
> --
> Kind regards,
>
> Sakari Ailus

