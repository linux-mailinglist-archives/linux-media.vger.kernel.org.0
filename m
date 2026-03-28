Return-Path: <linux-media+bounces-57446-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJ6HCkbvx2mcfAUAu9opvQ
	(envelope-from <linux-media+bounces-57446-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:09:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B94334ECB8
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30DDE30263F5
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 15:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CD2344029;
	Sat, 28 Mar 2026 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfBL5UsL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3D632D452
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774710594; cv=pass; b=D+IrqF+6QXRtyw72TjERmZa7QrasotqM3zP0oHxmu97O7+1aeAv9qWOiwTviJPkn8q2p5tKdoqIYRRch2pbLVIH8SLThiB61+CH05Nz/gQ8+WPmaj7Si1w1j2H9IyBfSwQy+e52jfJ5m4E/44pzm6srg0E4UtwuqWcRDhYN8+4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774710594; c=relaxed/simple;
	bh=IioqiuEnWClehqyf6kuLnL06MkxuADF1V4yo9xN84uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPZfJrjJDIYOA3SQ47D1rUUDLhrjHy6+CISDZsjM8p0jwnyyNoH20xQVXINc62El7AQnzyrK9qUZbEE9CeEj57WZX/UPibVeIPNhWP/XoDFUMjvAarRGLFzCaNNRe0osbO3injPwA9LhfA6PfdOT4KWqNjb1sCkql8ulcanGXvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfBL5UsL; arc=pass smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d74aa6bcdbso1722553a34.2
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 08:09:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774710592; cv=none;
        d=google.com; s=arc-20240605;
        b=dwxy3cg93igjj5bXXZlteQWKGU9a1wgqsekfcuRpDZB41itThSsDycxIcFIhrD/Nf7
         88f50/b84222nWvkIrIWAHMTfFmtj47/UZI+C1diRdfETsScLwr32l5kd7VcUhGjnycH
         mwJRcS8gn7VRhedcrTTpM2lm7p/hJqqxMxBJRw+UEITESHnjsguFbsADx8RWZHrnsur7
         paoxeNEQ4kPW6DwIeXW9WUFc0YqSWviTTNlwr8dHWAQdoXG6fTHcJcgK2zgwVp96A5RT
         RojyxqzSkE2qcEej9Sye5xNrpmd3fg6HzLg4MQ+wr4ryavAc+pl5Ubc0LNRJt/aXsDUc
         JDBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t4pH2aZy44NwbJt2RTZwPfT6J+uUkQC1o5bzn/r9BTY=;
        fh=PRYtMFE/mkhS1KVCZGaO9lCDpL6yWVHp57HWOh3PzVE=;
        b=AxyAz/mptVfpNbsSgronArBGNbHoL4OR+C3n3YdfIuMcb2T+Vs9epjB1YHpzGZbxSk
         oRUDfA73Z/8Y9SvbIoh7tQDnVAyvY4GkzNVpgDZATmBLZb94hrfeb/A8Qf467obiQ9xu
         0nzc4GIjNH1rUMHEnSUWFkQWW/jGL+32QBh+l2M2oBoAQhsGPgYRkC52wxShZIQuQb1V
         o6BPPCJQgeO1fyk/jbfZyzpvqJ3wus2wfljh1JtLXmahMrGjerkIGpxTibbtYfEnqwIe
         BFbbCjH30cFzoyTxMMHxHd+SM3/pGPRZkuRcPmehwc898cl7lfeUrgy8I5UDyC+nJtWM
         oAbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774710592; x=1775315392; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t4pH2aZy44NwbJt2RTZwPfT6J+uUkQC1o5bzn/r9BTY=;
        b=WfBL5UsLBlpKCRBco6kDzGom3KjxWt3+X5JzfV8JYnv6p4UUaZPMsbs1BOYyt0zE8w
         hasuwHbkxMWn65F+UziaoaTDgXBYJRVVfS6kCjO88YCtOH1INO1vXMQRqu5QN7MdtTT1
         wdQfST0dIbJGWjOKLEyJqPEKslmAzju+EAVvyV9g3kSrhnIrAtP8Sd4Ly9IxsZH/LLwP
         /KC5UQi6xYRo4sUiiZQXsCyWHLj5pVWYaGdcLpXssdGmMR/gQqZA/dXXQ6gz31tS4gWR
         S7z1jYEQsQFuEfYYZb/0/xKfF0iLNXpi/0NShvoNNoSP+BQvbsPiR7z7OCak2ER4azSs
         JuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774710592; x=1775315392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4pH2aZy44NwbJt2RTZwPfT6J+uUkQC1o5bzn/r9BTY=;
        b=gZeWNtimR7TkMR+BEyiQWycAUbqZ1rRAzYT0ggToJLE2Y8RJcmNztNhHNXmg+AFrxS
         Q0aON7NlWgHS8kjhB7XYXtGbzicsobI7I/xYF/Uk9wV93G5fM2IUzv8+6smeau77LvUU
         5WsTAVupj8DEHHxju+VQCXx7dnMitAIri9XK4h4ewZYes5bP/6ZxgD6BlWJLKKGXoVkX
         jHlXjJSL5LuIlZzc3oCpnLVMNk7fz7BvL1HuuVQqyjF2QOCb9UjDGCBjwITHb6vsNB8W
         xXLQ+EvxgmbnJksBvLXgjBpA/L8aVRtx+u2YYtkYDWdu6YP9ZDNDM9J336IvbNKj2Vmv
         CNmw==
X-Forwarded-Encrypted: i=1; AJvYcCV+W70OFrrU/xrZUmJTMvNi4jED8OpecJ8Azz/WjduGhZfE+HWDsgaLIBsqBE22sY8QlZ9X++eMZFpTiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUI8mBRx6WyZfZ8X73qJXbkMOLtYGnRl6d6bQIpY/vJ8OBOYUP
	bjgLouuU0RwLJso5HOcXHwKna74MXeOPtgFYXUBZZWv6F81dhZL0tTOFUI9XAZvAHCcmR55O6Vm
	pVPH9hK1WNnjrGkERaNNBap63d5nTgTrnb70Jrw4=
X-Gm-Gg: ATEYQzwX4NO2Ry4QjtzmtPSZElcVtElsM/mS42PvdT1JrmR2Cjk/AWFE7gI5zdsAI5H
	/wq9DwcDfQK6Eir5ZWJbYRJhCfgRGzAn5JHU2sYPQO2ucOP6IKM83erj0m6GEhSr/j1LEHWZCwy
	wN31CGYqlZXnfpqZFuZuIc0gTUGNIhcBqcRGO26ehpbWrNTYHEk3gg8rEiWcdC/l7eDdcnxkRO6
	hTn5hO9TQB5n9LqGl7EYq3NXd44gIgBs8An5z4qsqcd43FvcAhkws+UXJrRG257ztSITpc2ojmE
	IlhFRZE6Qum2DA023zCtShRCtDY/iTJAoXiJxw==
X-Received: by 2002:a05:6808:ec4:b0:467:f636:23bd with SMTP id
 5614622812f47-46a8a5d55cdmr2874982b6e.42.1774710592461; Sat, 28 Mar 2026
 08:09:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327150707.256752-1-devnexen@gmail.com> <20260327150707.256752-2-devnexen@gmail.com>
 <aca3Y6FHItK1cb9l@zed> <acfrMuiiRdCTNoMw@zed>
In-Reply-To: <acfrMuiiRdCTNoMw@zed>
From: David CARLIER <devnexen@gmail.com>
Date: Sat, 28 Mar 2026 15:09:40 +0000
X-Gm-Features: AQROBzAGlf0vcuBeV5AWNpamqI7OJ93nPOzrJojRzE52EEvmlh8RKegH80JOmv8
Message-ID: <CA+XhMqxnjxfKdHZC7XOW5K9TgZPD-MHyiNZggHhNFdTpwCa9mA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: mali-c55: add missing pm_runtime_disable()
 in remove
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nayden Kanchev <nayden.kanchev@arm.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57446-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8B94334ECB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi sorry I missed your previous messages ok looking into it. Cheers.

On Sat, 28 Mar 2026 at 14:58, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi David
>   since you have to send a v4 anyway, would you care about also
> powering off the device duing remove ?
>
> I have a patch, but since you're already looking at this it doesn't
> make much sense to pile another one on top.
>
> Could you squash in the below suggestions ?
>
> On Fri, Mar 27, 2026 at 06:01:29PM +0100, Jacopo Mondi wrote:
> > Hi David
> >
> > On Fri, Mar 27, 2026 at 03:07:06PM +0000, David Carlier wrote:
> > > pm_runtime_enable() is called during probe but mali_c55_remove() never
> > > calls pm_runtime_disable(), leaving the device's runtime PM state
> > > enabled after the driver is unbound.
>
> I would use these as the commit message and the commit title:
>
>     media: mali-c55: Power-off the peripheral in remove()
>
>     The Mali C55 driver doesn't depend on PM. For this reason, if pm_runtime
>     is not compiled in it is required to manually power-off the peripheral
>     during the driver's remove() handler.
>
>     Also pm_runtime_enable() is called during probe but mali_c55_remove() never
>     calls pm_runtime_disable(), leaving the device's runtime PM state enabled
>     after the driver is unbound.
>
>     Manually power-off the peripheral in remove() if the peripheral has not
>     been suspended using runtime_pm and disable runtime pm.
>
> > >
> > > Add the missing pm_runtime_disable() call to the remove path.
> >
> > The driver doesn't depend on PM, so we need to explicitly power-off
> > the peripheral in remove() (and set the pm_runtime status to
> > suspended)
> >
> > >
> > > Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> > > Signed-off-by: David Carlier <devnexen@gmail.com>
> >
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > This patch is however correct, I'll add the power-off on top.
> >
> > > ---
> > >  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > > index 5cb59c70ffc9..38b11d5ba168 100644
> > > --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > > @@ -859,6 +859,7 @@ static void mali_c55_remove(struct platform_device *pdev)
> > >     struct mali_c55 *mali_c55 = platform_get_drvdata(pdev);
> > >
> > >     mali_c55_media_frameworks_deinit(mali_c55);
>
> And this should become:
>
> +       if (!pm_runtime_suspended(&pdev->dev)) {
> +               __mali_c55_power_off(mali_c55);
> +               pm_runtime_set_suspended(&pdev->dev);
> +       }
> > > +   pm_runtime_disable(&pdev->dev);
>
> Otherwise, if you want to keep your patch simpler, I'll add a patch
> for power-off on top.
>
> Thanks
>    j
>
> > >     kfree(mali_c55->context.registers);
> > >     of_reserved_mem_device_release(&pdev->dev);
> > >  }
> > > --
> > > 2.53.0
> > >
> > >

