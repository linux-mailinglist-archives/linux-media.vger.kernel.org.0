Return-Path: <linux-media+bounces-57582-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOx4HaNFymm/7AUAu9opvQ
	(envelope-from <linux-media+bounces-57582-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:42:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0111358609
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD1B13006B00
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BE43B47EF;
	Mon, 30 Mar 2026 09:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhI1me78"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4D83B4E8B
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 09:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863357; cv=none; b=lQxmwYyrTBDpmkc2YxRQVQLhmCgCJ+WJ2Fw9/odz10wPChJqKb+GWjuwD8xQp/PqSjqBtVYmURjjgvtxAcA9aQqugtcnViGUW//o7zF0hAdhQ4FCanYg2e4FA6sCCtRz0FvPSjG51KbEjZcDW/8bFHUC7SS7LJBG0fzDi9w80B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863357; c=relaxed/simple;
	bh=tq4oN7AsTkVPYAUo5oteQclgprod38EBmp/dLhKOQ+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AllUmM24ZqR0E3/+DnQ2H5D6z9I7rOxtoxVeJSAo7jV+Te15fOY+pOujU8M0+uzk4YGdtYs3GoS2iavdQOz7UyxsfGfQrWm9fR9vzY5mibq3usWLQ4gjd0/aynvTiGa2VdsyYyLse/53EKqlDebIVQ0Go8NSuQqsCwJKijxMe/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhI1me78; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486b9675d36so35505645e9.0
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 02:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863354; x=1775468154; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dw3GlJzRigow5MEAZRBZ9gfDU7AZvtgosUcNlmBiH4s=;
        b=jhI1me78T+JhIjIZ/6azY+4WuhXzjOcC02hDTQSE9NFuc+bd2jadu8ES9yleZwtVgI
         vuwJnbbCj+/oxUUwgGJb6A3rqCeff75U/Rs1KXb1lNqvfJw2QZYpb9cObvJorhkwsHbT
         T9jP4h/BsdTzriwtH5HqxsGtgEAQ2yn2RYce2M+2SwRYp2lNSqyL4BZE/9gxjArr9Neg
         NldNYOlrgixeL0Z0Ob9MgsBSwRZ7k2Qd28e5fVLDw6XACgPITMvw8QJWOzq5woyx6dY1
         5j/YF3BhQpbAe+b2c7mI9A/VXMrvpnK0+CFWi59JuSd5d8PPu13nbiFkwvJlhS7af8s8
         T0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863354; x=1775468154;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dw3GlJzRigow5MEAZRBZ9gfDU7AZvtgosUcNlmBiH4s=;
        b=n+6sDRGZjK7X4ocHoCQy3lmaVuf0TLsjfcoSDjq/pa5mDb8FKrCWwtHVQ75LQkusBK
         lpXHYlNiIsC3uml180HpXHdfx01ai7dESpI8BZMCn6LlypBp/Mp3OtK7aV4jXm064Y+r
         3tm/vSZyvyXDZGIgz5bfrIrR/TVub9utHp4r8/4egrRnke0DspMLQnCTa6LnvJGZAA/1
         7Dg/6RMt5TzYUSC/ZaUNiY2FRS4JWCA7WP7yjabPy6s6nIyBwZUtS/I2B8YiVPvfqn8Y
         zPis9rJByfj0ex1DQ4vGcHF5WYQxKlNG8E6eHh8vQSyv5cEVKQ3jMzMgoZG+2vmqhMlE
         XSyA==
X-Forwarded-Encrypted: i=1; AJvYcCUzEk5ZPdJMwNu80as7TjQqKczeSxvnO8F/OIbSoCIqzX8/1d3cpLquoX2/kDlU14zK9D93Yt3087CnKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEkJVCY9f80rHF2BflnAmS39YphCxOEMpSnvgbWtUp1MV4zIT7
	66dP1HDSNNhMWy7Gt2MP7z+V8iRMy2XpbmA0FVee9CmcZdNoRhY5wSsZ
X-Gm-Gg: ATEYQzzbwaGBd5PHOxsnPq6VUAZ9dZZxUqL6NFJWAMqgc8dlR3D7jUE5+eF3bPJJ+5I
	fARLAnsoy+YSIy8KfilgUeDdFbw6IP8mDoHYECiqL6UldJNcpG80TF9VRKJ1COCMHFp3MW97ewv
	KQq6yIYMP9ugNFTAj5YNU1A81gnmTt5ZACB045T1+MCQA+Bgp1CrvlxIOTmlQUrPqK/xHO6VaWu
	++OG+bGrGAiq9z9jo33biZKS1qYXvjuc3FHuJrbDmc5TTV9cYbodLgKOlbwacdvz+/GN8FxRdKE
	2uWRu/0GF+dAyt0GHbdS4LVR74D34hunZ68oDcGpE1GG9HnVVQeFX60DM9ec6kV/JBizTn56Xm2
	jyybaWSBVYoq74fmNAZDbcX2k4017w4kiDHNhbF+NBkoAt0YlhojnQaAcJEoTYixdZuODDU6esd
	yI07VmyAro68lhjzu1Nyc=
X-Received: by 2002:a05:600c:c87:b0:486:fe83:8621 with SMTP id 5b1f17b1804b1-48727ede17amr203752735e9.23.1774863354250;
        Mon, 30 Mar 2026 02:35:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26884641f8f.0.2026.03.30.02.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:35:53 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:35:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] staging: vc04_services: vchiq-mmal: validate
 component index in event_to_host_cb()
Message-ID: <acovDyj3L4ORCn-H@stanley.mountain>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329071616.507876-1-sebasjosue84@gmail.com>
 <20260329071616.507876-2-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260329071616.507876-2-sebasjosue84@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57582-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: D0111358609
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 01:15:39AM -0600, Sebastian Josue Alba Vives wrote:
> From: Sebastián Alba Vives <sebasjosue84@gmail.com>
> 
> event_to_host_cb() uses msg->u.event_to_host.client_component as an
> index into the instance->component[] array (size VCHIQ_MMAL_MAX_COMPONENTS
> = 64) without bounds validation. While the kernel generally trusts the
> hardware it is bound to, a bounds check here hardens the driver against
> potential firmware bugs that could otherwise cause an uncontrolled
> out-of-bounds array access and kernel crash.
> 
> Add a bounds check on comp_idx before using it as an array index and
> move the component pointer assignment after the validation. Use
> pr_err_ratelimited() to avoid log flooding. Note: this file does not
> currently have access to a struct device, so dev_err() is not available.
> 
> Cc: stable@vger.kernel.org
> Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")

This fixes tag is wrong.  That patch just moves code around.

I can't apply this patch to linux-next.  Is this another out of tree
bug?

regards,
dan carpenter


