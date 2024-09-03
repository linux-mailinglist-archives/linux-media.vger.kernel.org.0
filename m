Return-Path: <linux-media+bounces-17467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D0B969B83
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 13:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BB9AB20BC1
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 11:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F381A42A3;
	Tue,  3 Sep 2024 11:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AV2WzFJs"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716DB1B12E9
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725362539; cv=none; b=tHy3MbiMThE/6ZPhm1PIALkQy9GU8OTQ0ip3PArtPePxqwqxvFHNCG5aZYEkl+8t72GcdUgn+dg4YCzR08/ONYRXi+UwBXi9m96oBZ73rbvTBbMal8n4HuLLjW8Ssq7A3jVW8YLI7Q3k0zrdwqqQLdvRD6A7piD6NrylD5G+1Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725362539; c=relaxed/simple;
	bh=Z1Plxnh4t4Y9zKCz8lobz/PAgECPO+iU8z6YGFd97Ts=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YEkPAQCbpopMCZtT86NvJDMgQiNX9I4hsOcwYPNEPvCPpfB0KSct/pr7Jrzy/zlFx8H4d+/fgOJ5hOW8kGjBO3hGTx7rpYaB8Q/tE4Q+3pFiMqKdJCVzmDXkq4nNRbkQz+UAjzNJgEw5KzLcEPD4mwHKiqgVHBOubsW3cgQNkY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AV2WzFJs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725362536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1Plxnh4t4Y9zKCz8lobz/PAgECPO+iU8z6YGFd97Ts=;
	b=AV2WzFJstb7P5Qez2ZHQk9h6p5gQlTil8Om1A7VUfXX0CZhtLf7yJsnh/O1o9m/MwsbDRv
	sisl8VqKTuRy1X07nqFOTQTvl0/KTzaUDt2/0om7xXF+OtVDpBQmzpZXYMpbnMrzQDAgaB
	HIcUhwD1AeIF2Z8CgBC/xxxLP7c+24k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-Rbmz0oJWPGaGuoBe4PYHWA-1; Tue, 03 Sep 2024 07:22:15 -0400
X-MC-Unique: Rbmz0oJWPGaGuoBe4PYHWA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42c7936e4ebso28987485e9.3
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2024 04:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725362534; x=1725967334;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1Plxnh4t4Y9zKCz8lobz/PAgECPO+iU8z6YGFd97Ts=;
        b=cTgQiNiuWkVelTs4zKfPpX1MbXInjgdk64c4VUM8Pa9Aa8EVmiOTG1xKhgiruE7WwO
         TFcNtHQwuS+HjeUQl3XPILfn3OrdUZc99ny73BzOMsmehCPx1sTMnIgpaO1nh16TEGcA
         wq4GMUbYzoAoafO5vkw2XTwXB4GGn4/ERdbOQ7CN1KSYNq9VJgojBYGFQ/6bJEfr07q+
         J1ARbrUy+GTwhtylazfhABp3FboocX/hdl1xpcrbgrvzoAzD7GPOnab3sj7h3pLbn6Fz
         vhFt2IZTsT7mvQa6LTR4KDHL/MALbanWwQ+GqR4dulTnTAS15U7WR5UtZeB+xWPyZGhl
         Snsw==
X-Forwarded-Encrypted: i=1; AJvYcCVN1Uz9eJb9z1rsDTzb5e2AHW+lhbkYLaTGaxxRqE1uywu2B/HL1PCrsOHnPaFduqQjAGdrZcfd1WocpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd6748sxnqhdvYELp5K3TNSbRv3OyOsCHOqVVjvX3gTolMy6Oj
	G7PZjdtxYRYLydefs67U+oA569oflnZ0TG1Wcv6yNaOOzqC+yHT8fIQaZYE3gzUdgfao2qdd6m/
	weLbnGhiZeJewRCYi5+2hB+ZQusO5123k+e4NMg1L+OEtKyTmMjiF5E5JtK0bJU+Q2S29
X-Received: by 2002:a05:600c:5124:b0:42a:a70e:30fb with SMTP id 5b1f17b1804b1-42bdc633480mr86486265e9.15.1725362533840;
        Tue, 03 Sep 2024 04:22:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6COTfVIHWvgmD/gGNXfCD1JVrB1iMqBL0oCM5NIJ7i6bn9LPx763qCJNvMRV7QvNTevJ8Ag==
X-Received: by 2002:a05:600c:5124:b0:42a:a70e:30fb with SMTP id 5b1f17b1804b1-42bdc633480mr86486095e9.15.1725362533395;
        Tue, 03 Sep 2024 04:22:13 -0700 (PDT)
Received: from nuthatch (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374bde83ebdsm9371828f8f.48.2024.09.03.04.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 04:22:12 -0700 (PDT)
From: Milan Zamazal <mzamazal@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: libcamera-devel@lists.libcamera.org,  linux-media@vger.kernel.org,
  Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: Interest for a libcamera workshop in Vienna - September 17th
In-Reply-To: <20240729090042.GA2725@pendragon.ideasonboard.com> (Laurent
	Pinchart's message of "Mon, 29 Jul 2024 12:00:42 +0300")
References: <20240729090042.GA2725@pendragon.ideasonboard.com>
Date: Tue, 03 Sep 2024 13:22:12 +0200
Message-ID: <87ed613rtn.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

as for agenda, would there be an interest to add an item about what and
how we would like to achieve with software ISP in the foreseeable
future?

Regards,
Milan


