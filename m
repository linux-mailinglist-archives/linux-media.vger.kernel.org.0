Return-Path: <linux-media+bounces-57124-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFUEDsXTxGnk4AQAu9opvQ
	(envelope-from <linux-media+bounces-57124-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 07:35:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC14D32FEA4
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 07:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFAB030A812C
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 06:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E9F3B2FE6;
	Thu, 26 Mar 2026 06:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ht1WfVFg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496823B585E
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 06:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774506493; cv=none; b=bVzvWxmEl1fV6TnSuoAzDk7/5j/ESel5Rw3EGjZyuzb23buOFXR1xEOuIkrByMIG852UG8xg+d9br0OGisfkX3dXcidyXHZ8LedaY9dTANdxIq+8Ou8lIKcmcCJ/59hZR731MMVqIkrlfleor7i/0lIW/Vygr1PMKEzlnNP9vIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774506493; c=relaxed/simple;
	bh=F+qgbLJeK/mZyW0eAoJgONfbmmXiA/dhNJR/qEvQLXI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rjBhKJCGshIdGHt/w93L5YD4dg0zBmpuwqioSOazftN2Wji5GRC07ltBkTXDvz+u/8bhXD+Kx9y92rdfX1TXYNEFt0ziACyVYA2Rl+vNnFUxxtFnUBywak9O+GirxMN9Cst9Fq/BOl2Phwf2zsAhvtX/Iwl2jIJgv3XfkvrYlZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ht1WfVFg; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b0603ee486so3876615ad.0
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 23:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774506491; x=1775111291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zgfn7bF607W0nu4oP4iVmN1NneBMEf1vV+dFphRkIQ4=;
        b=ht1WfVFggIbKgJ7ct+PNqKdfrzbkmYw+PbaHBspf+VpBcwgv+uo0becZYHaj2FUxM/
         2iOHFpS6cJbghwIVVL4TMVR2qEw5NhIBWQbieeOQL2s9fMwWFBTlRJo0jryaEliuOPyt
         1cTJFeQ83D+rji5CQk5U5cuahJSiSKf0r203RkBcbGiv7LhyZlu68mPbM9KFCnsowTxS
         YUUso/R25Y6FwHtlTYgzeOxJZisZ6Xcr06G0StyxSFozPikaG4BaKXm8joTF4iS3om2y
         3WldK5eGRd7Gz6hi9QY5cmypJFcR5SMj+h6qqA/7QnxpOgrgTuE8RDnmN+3P94CbIxRV
         TifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774506491; x=1775111291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zgfn7bF607W0nu4oP4iVmN1NneBMEf1vV+dFphRkIQ4=;
        b=f5K3BIxhlo7SlFjt/adeB6wdVjuiRoI0+uQ5UKm96sA8A6Lj7BBXq+Kgx4QwSBiQQV
         /5n76ooPAV4gJTG1G6r9fMw4OlBCLw1Rrb5GshCmJ2aS1itAxNB8nXY+OwTQYODzME5d
         3poOyYNTNBoSAGOEp/ZNZA2nas9EMJCjiijkpgrKIQtu3C3suw6Fkk7watR4S7J4/lYU
         EaWQW9ZabBQe0dgb+o0cOvvFuSLL3L7ezLdeTf4z6jAJTKePl+NP4eeUnfcr5Jfx4yYs
         R0eXS04RmjF2HpP+DED4nIW+0vbA38yNkPWuoVouYcAekkXYh9eNz/j3K539XE9ehR1g
         /Hgg==
X-Forwarded-Encrypted: i=1; AJvYcCWXauiRnMv5M4BX5psGT5JNE8wfVDwyfGdBzj+KVRwqg9V1x0/zrBTQPfANadCJpQwkDznEvU5nm9Fqxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMBT5rRALXQgeOZVHtIQRLc0I6BItJ+ussemQbLN8cYLcZbxI3
	pvqGKGYVQoYSYGbjlUV8ppXKtyxyA17jyjlzouGD3sVObU+7yidPewEJawWsyUROPCM=
X-Gm-Gg: ATEYQzxyv8vpqLX6QK7YQPWR12eRED0Nl6+TpJMZy2IC4Uc0Rz5/PWAFw16MIBOkA8d
	Bp/zlQc/nKyEA+pQu35OP1sFS98WD1yPXwYNkqqcGn54P2a398cBT271ETzsz5m58XjoyZxDknx
	g6FRvESTckFt0xkTFmeAT8WmaXUnZCd3K3JVB7VoDYiTlBEvjoey28Gxgc6LN1Vi6KWYfgef0Y7
	ySJT5iw2Q+bFPE9GkLiaEr+XXUUtzqCPsW/37ZXiYu9zo5I/Qi9IU/OEV34GNKsPrlw5htQ1i8h
	UBEIzRVg9njtTOkS4j6+USahcC4kswMaynaLNgpocW5upP6ZCyg2bOE/gfbyU3IJE1f+vZPoP41
	DdG03VWax0D3GNWJ1YvOTLADFZUoBWI1kq4Y5nIZvEgJ9cvg6krtewmvdh/WkWDzRs8Gam/p7oV
	Xe1YvVsdHmaQSET4NBRR4i+VjSako3mQ9PBm+a5OE4Q0FJDjcEFrec7+5DgQ==
X-Received: by 2002:a17:902:ce11:b0:2b0:65b8:b5b4 with SMTP id d9443c01a7336-2b0b0af3cd1mr69453485ad.39.1774506491524;
        Wed, 25 Mar 2026 23:28:11 -0700 (PDT)
Received: from xufowonmvnism.localdomain ([2409:893d:dfc:c0d:7400:1a1e:2833:e706])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc76bbdcsm18803525ad.5.2026.03.25.23.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 23:28:11 -0700 (PDT)
From: Lian Xiangyu <lin25001x@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: gregkh@linuxfoundation.org,
	bingbu.cao@intel.com,
	mchehab@kernel.org,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: ipu7: remove 'U' suffix from hexadecimal literals 
Date: Thu, 26 Mar 2026 14:26:28 +0800
Message-Id: <20260326062628.2498361-1-lin25001x@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <acOgMi9Ww0MjPAnq@kekkonen.localdomain>
References: <acOgMi9Ww0MjPAnq@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57124-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lin25001x@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC14D32FEA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

On Wed, Mar 25, 2026 at 10:43:30AM +0200, Sakari Ailus wrote:
> 
> How did you come up with the patch, is it manually written for instance?
> 

I used a bash script to remove all 'U' suffix of the hexadecimals for
the header files first.

Then I generated the format-patch, checked the modifications in the 
patch file to ensure no impacts to other files in the directory.

Then I performed a scan (using rg) on the directory to ensure no
leftovers remained.

All modifications are only on header files because I found that modifying
source files will change the binary artifact in my initial test, so I
limited the modifying scope to keep cleanup work safe.

--
Regards,

Lian Xiangyu

