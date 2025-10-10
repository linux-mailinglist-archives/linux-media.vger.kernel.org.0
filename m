Return-Path: <linux-media+bounces-44141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CECDBCB78E
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 05:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4A3184F044C
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 03:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F6A256C83;
	Fri, 10 Oct 2025 03:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/Im5P7r"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CFC22A817;
	Fri, 10 Oct 2025 03:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760065571; cv=none; b=Ecz/O2Ix/V8DvOm362gCNZz/7NYmELkHfN1NQfkBNDQsusvpA7MMKfZtQ8lbbmi39OB5aAXrPRMSu7gMAkMhzHaFs1a1qevQ4ifz/g2Faa2dQnYWYFXkdWdqFZsZChhC0q0LTjmTuww/Pu0OH9g3LRExl+sL1MoUGYijQBtfwNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760065571; c=relaxed/simple;
	bh=gQrQT8/e3hBdCgznhJmkxI7OHrbG4fJT1jaxAZzRstU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VShuWB/MJ/xOWa+TAkK0ZwTLjensySrLNVbeCXtegOp3DxWMR8JI8VpNlczNXqU3wjRbPNFgfoWxKN+n1le/m/rds6YqDBbBBHNG0QorlX7hAnBrcy0vdGgMf1Z/234t4vIIyjo+OpAd/B89HxZrNR2Hh2aqtBCgdGAxpLw/7UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/Im5P7r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8A8C4CEFE;
	Fri, 10 Oct 2025 03:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760065571;
	bh=gQrQT8/e3hBdCgznhJmkxI7OHrbG4fJT1jaxAZzRstU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z/Im5P7rrrQXbTbyanMEzID0u3A9Ciw1tAePf1/0oXaMumOJ3yBJc/xmfulLM6ADE
	 hZT/EELqWNEf8NW70gnIqydzIh4kH+skDIU/hLKX8WN6BDhBp/5eQKDo8kPOj6mX6l
	 L60gqp8IJtz0F/GH1/7JTXaC3U4MSSjzXQxF20U7rlNmlAfevhbNilPtUIXWrhJTRo
	 hIdortyOtxt7GaATuj1SENK2XbEXbuT2WlZMpHiF9WMmFyxh0rTLACGstAP93WHOx1
	 4BHe0KYlM1VpLNu+6LoE5mmMJvJ1NovApywQW8dnlXv+sg8goEtJfEtK3MW0dqAwQl
	 WmisRqus/sn7Q==
From: Kees Cook <kees@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-media@vger.kernel.org,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 2/3] media: radio: si470x: Fix DRIVER_AUTHOR macro definition
Date: Thu,  9 Oct 2025 20:06:08 -0700
Message-Id: <20251010030610.3032147-2-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251010030348.it.784-kees@kernel.org>
References: <20251010030348.it.784-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733; i=kees@kernel.org; h=from:subject; bh=gQrQT8/e3hBdCgznhJmkxI7OHrbG4fJT1jaxAZzRstU=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkvKhRereN/ytKTUD7rQgFjdP2ZW2eaqtb3afC9LVpq9 vHpNK7ijlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgIlM8mb4nyouXV+YZFxcmS66 JuyZ4+yX89sV5gUc+1xefrVPp+3cLIY/XCL21pcCPZ1Ee0XePJMtEP56d/2fTdE+N5dumi60ieE SBwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

The DRIVER_AUTHOR macro incorrectly included a semicolon in its
string literal definition. Right now, this wasn't causing any real
problem, but coming changes to the MODULE_INFO() macro make this more
sensitive. Specifically, when used with MODULE_AUTHOR(), this created
syntax errors during macro expansion:

    MODULE_AUTHOR(DRIVER_AUTHOR);

expands to:

    MODULE_INFO(author, "Joonyoung Shim <jy0922.shim@samsung.com>";)
                                                                  ^
                                                       syntax error

Remove the trailing semicolon from the DRIVER_AUTHOR definition.
Semicolons should only appear at the point of use, not in the macro
definition.

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: <linux-media@vger.kernel.org>
---
 drivers/media/radio/si470x/radio-si470x-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/radio/si470x/radio-si470x-i2c.c
index cdd2ac198f2c..3932a449a1b1 100644
--- a/drivers/media/radio/si470x/radio-si470x-i2c.c
+++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
@@ -10,7 +10,7 @@
 
 
 /* driver definitions */
-#define DRIVER_AUTHOR "Joonyoung Shim <jy0922.shim@samsung.com>";
+#define DRIVER_AUTHOR "Joonyoung Shim <jy0922.shim@samsung.com>"
 #define DRIVER_CARD "Silicon Labs Si470x FM Radio"
 #define DRIVER_DESC "I2C radio driver for Si470x FM Radio Receivers"
 #define DRIVER_VERSION "1.0.2"
-- 
2.34.1


