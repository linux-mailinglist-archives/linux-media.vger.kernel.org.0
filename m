Return-Path: <linux-media+bounces-43077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0E3B9B7F3
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 20:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9C451BC0E30
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 18:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68ED1313D72;
	Wed, 24 Sep 2025 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efsmGQUS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F5E242D69
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 18:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758738782; cv=none; b=D0i9Z/A1jYO7t3+iLNTTyBMBORuQB6W3MepdArSv1d+YzG0eq/jdAyY8zKS3XD/uYVrx0sA0i4h2orAxUIgaWN9q7hu0e0G/9J/UHGjhuP2aiVEkaPQ+XU2KClrERZkOx8Mw0yh1sgMav9JSurm1loNpVXmSMXLXMNHd7AeDpPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758738782; c=relaxed/simple;
	bh=BPmp7/HZwCEN2P3jkfww+6QmR4v0glh9O0ulkchMmyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxg9Rc97MiAyhQja+nSzkwvSsPTfJUclfXQMzOyuYGvPJo+CJNtqkX+BN8mQI99VOnRt/1bY8fBk/uLAz7YELjr4wg3yJD6pTFnPMXNWeyvFgHFC6ZVKo+bYTaD2otAujxlYVNSgld3OZiZR3bndN1PxSeYxKCjOH/zbr1+5l1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efsmGQUS; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77f2c7ba550so154474b3a.1
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 11:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758738780; x=1759343580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZiGUngEg1bz9RIGYOxgVE+7eeU9JAJ9lijyiP/taFE=;
        b=efsmGQUSpeAlPhYHne6mC9XC+C9cNzm6ws/4Ul28qA1tV22MQq/u+/O0JouKGUlWsB
         Wg8aQR3IWtavWeaibMajUZYpQ73rb5v4O6F0KOmCFAq5Gz6PwNetVK7bWKp8Tw6mPL7E
         5ZuAfkeO8xgdBah+Js9Z3uVhESeJZWIqvVbPgx3uF/xguI+WgG4yLngOl9cmHZTTn6Ng
         LS/WfY3SG3CVQ37ATQh/qhypJX5s+AoKuctiUHKPWFvEPbAOkCNNC8g8OLLCR3UZ23Ka
         g8HLw1zh61PvqSya2YzFZyovay2iCDkNmu+7zp5GQKFxoSswiC8LBZczkewG1LArYuuk
         HlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758738780; x=1759343580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZiGUngEg1bz9RIGYOxgVE+7eeU9JAJ9lijyiP/taFE=;
        b=a59euJVq3YxtRfpCmTS8YZiwMczOR3NIypSzNwZzf8MupJaRcVSXLqUkAala7W/LBS
         1EdeFfmZK2aYLoNvVFrNNodEuOYbN8rW3TKNq+L1yOV5K3p3xCO3OOrSiLcIipKc9eyk
         t53B2daA9Jtd6X4fCziwH7P+UH7Tjq3md3DUnzM8Io7OcebCbBb1N/9LvtsPdt3ak8TY
         GKT+OZOFx7cJOBHGt+/hPVUoqgvFhX1BmVXP6UjR4kRe2u4RSvhtIJjEZHEIo6+txbN9
         KaGnVLVVgbBEpY4pGJaVSj0Ta7DhnqNkXQeSf4RhxLtYnME9478g0PinwWiOiG6p7hPt
         pqRw==
X-Forwarded-Encrypted: i=1; AJvYcCUdJ1Be25k5Q2fPlgGs32ZzcuxkfHaONkuML1+REvJCH6Lhgdd3mO5KqMGpVzWkaAxX6GvkwQjAFtkWJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBl7CIEW1fWNrdB5wl9GU0wMP14pIK9IgPLC5E8WtmONz8IrIO
	eZpTXQUtKahgObdwyEUD0d7uwNDiU90gQwX6AXmyiJNG1a5EnpmaV0fY
X-Gm-Gg: ASbGncu6AMJ+vtJMWGvrMiZ4475tQDdMFQ/CpUgET8hBDG8eX378jZ9TmwL8ZyBWPPB
	qaqFTdK5zDt141JLYR5hg9Vp2J5AFf1JYBJljUmH9Vj8jn9H1ZVIzx9CHxrBCb0xT7B+x++SfJu
	TXSgd6J3O2/DuuCcW4KHpl3YkMi/MCC9Po5EwczS/JTUXNCC7+GCj2mux1tblS21js4ShU5A9LN
	/f8Lepv0mD9erVRCQlq+pPydNd+fQlinX91FsQ4V1cjhQuqXrnKyZ1uD4EH2rAS4E5+xZqawv7A
	0BqpOm+L36rwKhq0vSlbYf/T1OcpKcUBu9M6JuJqg2vZEDAuAc02C/sgfN+Rf1H0ech43nFnGh8
	xgRfa0Icn1nXIJiSVYXKoDMk=
X-Google-Smtp-Source: AGHT+IGjh8GHJkW4HrCxPM3eBOhaOjfwbgk4g/556B0RsOzYugb+CgPT02LHWIyv3xFJhWkcNdv5fA==
X-Received: by 2002:a17:90b:3d4b:b0:32d:d4fa:4c3 with SMTP id 98e67ed59e1d1-3342a2ef04fmr506703a91.31.1758738780237;
        Wed, 24 Sep 2025 11:33:00 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f4c4:bad6:f33e:ddc9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bda06ccsm3113092a91.7.2025.09.24.11.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:32:59 -0700 (PDT)
Date: Wed, 24 Sep 2025 11:32:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
	netdev@vger.kernel.org, linux-spi@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Javier Carrasco <javier.carrasco@wolfvision.net>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Matthias Fend <matthias.fend@emfend.at>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Mark Brown <broonie@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 02/16] ACPI: property: Use ACPI functions in
 acpi_graph_get_next_endpoint() only
Message-ID: <iqfarpvf72l7qbhfinopjb27qvfm7wg77d4yhuy5qyubcwtcd2@exmcuvgqr353>
References: <20250924074602.266292-1-sakari.ailus@linux.intel.com>
 <20250924074602.266292-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924074602.266292-3-sakari.ailus@linux.intel.com>

Hi Sakari,

On Wed, Sep 24, 2025 at 10:45:48AM +0300, Sakari Ailus wrote:
> Calling fwnode_get_next_child_node() in ACPI implementation of the fwnode
> property API is somewhat problematic as the latter is used in the

How exactly is this problematic?

> impelementation of the former. Instead of using
> fwnode_get_next_child_node() in acpi_graph_get_next_endpoint(), call
> acpi_get_next_subnode() directly instead.

I think we are moving into the world of mixed fwnode types with software
nodes/secondary fwnodes, so I do not think this is a step in right
direction.

Thanks.

-- 
Dmitry

