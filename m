Return-Path: <linux-media+bounces-57178-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMWeJOOnxWlUAQUAu9opvQ
	(envelope-from <linux-media+bounces-57178-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 22:40:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDB833C0A3
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 22:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 876F730C3324
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 21:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A743A7F50;
	Thu, 26 Mar 2026 21:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XrQsfxlW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8776C3A7840
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 21:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560900; cv=none; b=i1AP77i++xyIhcgRNarWEnyILTbINWq0ria/pASYLATY/2QbdvSfQyfQlT4qcVn4vXkYnBu1EFMqGU78ojWvVJteRz1/CA25hbGmwKUVZ7rvIuyAqtMNQerPmQTujrTbUV7Wjdv2ZLBOqALcKCMoPSrUZ2oGt2DtU+4S8IiiXV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560900; c=relaxed/simple;
	bh=7o5MgVSO/qsaM5mSZ0Wv6cG8RqmY9Li1Q+TtGkk2SzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q0irWVfL2nw5iEIPJluCWBfduJRTR3ztAwyXE3uaFHONh2KFUfCZfOGpd5oVp7iRutTTeyMtuPxTaMhYSqdD0xsv3m3P85TuP7mnNW3F95vmEcyoidp7PqOFmLCdojmuQJ7iwpQqSsMi9XMFkdkBkBIjrC+b4BdcXN9PaFtIlmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XrQsfxlW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48374014a77so17732385e9.3
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 14:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774560898; x=1775165698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nfG4+xyHjyGndG08zbjd4lJLrSPoKYcyTNHjlwNnYuE=;
        b=XrQsfxlWMGTyFuDuuQWCA9W0kx5bq0XSqyqpUspqyXYmZ8BqMSmqMNjoQQTvDkce9C
         0wvqEpMjj7O8mdivuHXW+n88m1FKvfRjwS6hvsD17pai7PsOdyiriCrC0X2OjEzeIxNL
         5ZtT+dyd751qXEz+JyVYlcLTPfzYBglu5pkhTG8/xmydYZVlRsJ0ONT6gXl+1k5sJEe5
         qDm8rJN7PvrmWObhFZYsrQyQOrbElcxBwCCpXfsZPkJllXnQVbs1yJ37Fl7iXN5vd6LN
         ciUKH7dGfSxz0gQnhUaKw7s/yWpAqmiSDyxDXReq2GO6fra/raINbGmoClDUtZBO7++8
         0k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560898; x=1775165698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfG4+xyHjyGndG08zbjd4lJLrSPoKYcyTNHjlwNnYuE=;
        b=n7218F+OvNy7OEWigi/aZBtJNLIpJ+CK8bjaL3YGNfffW/vgEyHtLu0MzaSS7JTxvW
         QU9oZmslzfh3yfLSKnREqwCEgtIqXtKm+6QS+WjW/9MYq8e70/tM4eeN4bvuCMICjOVW
         UDmRHG1B9YEayX8K0VMn38zt6RJDRXP6vurTRuIhtLSXr1EghZvX8S/nLaZmv9nE9rKi
         bVG7wYQwH6PV4jblKAKKE+RLjmpW8OWsvJgaMigSCPAmrt2xVJJQUsloE6210R1WUjlH
         8SfOK/efzJcc3fNA/ENB9kP99TnIho8DTgjfjc6NmH4TzS2RId+rpauv9ZH4OImE4fKX
         1PMw==
X-Forwarded-Encrypted: i=1; AJvYcCVPyHGZYnnL2aFbkjQVaqkkqncDLAlVwulstFykspakLepkRYOHlFhAsnitRHGqUeLpPKKST6xbVEbRLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YycogKcy3RBF2Gj767wa04S59kATCrmeTerVp/QjseC0mxnvLpU
	bKGX8mOdPy48Pb8tTG3S+b3xAQRtR/BLy2qTvOyPYj5JaDK/im9khfER
X-Gm-Gg: ATEYQzyQITGKjyDa/DKarCsmlIkmVQF2iEHS/XU34JN/Q6z5HMVCOxgucfQnGeWODW8
	uKEf3uHi0wLUNiWTMPgNXB+5I6XU96x89KEkAxvtZa0tv5FnYLtm4jh/3PAK6AP+jJ0HmoEEIMF
	Yz0gk+ONzzS1p1mZEHnL9bS9uQHMj2Rd3C9i0oP4/JGBH6O6gNNMBfrqm7eY7AbXibY5NZ70fTU
	nqV9/prowXnrTdEz1iGUe6mnxogjGG5BH9q2vfuypFc58qwDlbnstFVJdGd/NRQmWJ8EQ+Igp1s
	d8b+eV91BpzIkLvJYBZtvxGab/jy1Z+jHmGkWyxgTfEWN2aGNDR8GwcHNDY8LytZuGDKihy45FY
	Tj9cmHmPBeKbc2c3mkaOkJLOLpIYH41fk4ehbyPGfu6ZdnugUmNtY7y7xFOZJlzWTysTIk/4ers
	X/k2TxmafLIRvYrKZbdR/cB1TqDvPMTLrcfq00hdOw9srYuMYgaguP7hgX
X-Received: by 2002:a05:600c:8286:b0:485:3a27:a960 with SMTP id 5b1f17b1804b1-48727c70637mr4121455e9.0.1774560897734;
        Thu, 26 Mar 2026 14:34:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1855:4ab5:5c9b:17ff:fe26:9b2c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c7cec3sm51106825e9.6.2026.03.26.14.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 14:34:57 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] staging: media: atomisp: clean up ia_css_stream_destroy
Date: Thu, 26 Mar 2026 22:34:06 +0100
Message-ID: <20260326213442.876745-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57178-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3DDB833C0A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes a loop shadowing bug and refactors the ISP2401 cleanup
logic inside ia_css_stream_destroy().

Changes in v2:
- Split the original patch into a 3-patch series as requested by
  Dan Carpenter.
- Added a Fixes tag for the loop shadowing bug.
- Separated the extraction from the logical improvements.
- Added clarification that assert() is a wrapper around BUG().

Jose A. Perez de Azpillaga (3):
  staging: media: atomisp: fix loop shadowing in ia_css_stream_destroy()
  staging: media: atomisp: extract ISP2401 cleanup into helper function
  staging: media: atomisp: improve ia_css_stream_destroy_isp2401

 drivers/staging/media/atomisp/pci/sh_css.c | 79 ++++++++++------------
 1 file changed, 37 insertions(+), 42 deletions(-)

--
2.53.0


