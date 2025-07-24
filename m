Return-Path: <linux-media+bounces-38308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DAFB102E7
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 10:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EC1916385D
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 08:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BDB272E74;
	Thu, 24 Jul 2025 08:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMh3s1D8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5224E223327;
	Thu, 24 Jul 2025 08:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753344488; cv=none; b=MQX1eUS57YNd2GiFoKZ5Byz4HKl1nKbyHAPZ8UtcQqb7//53VXW4gw9cg0qaeEoyENkMPXh6o4QDM6eo03HdJJddq5LSq5w9zlFce4HEKou4F45VTRMR52qynFL6rJh21MqSt38z8pmwhJmxT7zW8DF3Kf7lh89UiuORa04GPQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753344488; c=relaxed/simple;
	bh=D109zUVaN75LJ2BDCN+vmyDZuBNjWIBhOr8sOZnfsJo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z88EI1cPt55xHq4o/BuS4ueR/8LwykLBWs0ie7YKQXiFFljm2VCm6ZXJDtc2ui7P3VpiSAM9aS6VEaJqvurdoJqpWJ8e4LUmZnsYdoE+wSQhOBXP38dLghN+xZycHGE6IwKK0fviOMbO5k0WUgG72AUPK59dlv93M6ghc3UBdG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMh3s1D8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40A3C4CEED;
	Thu, 24 Jul 2025 08:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753344486;
	bh=D109zUVaN75LJ2BDCN+vmyDZuBNjWIBhOr8sOZnfsJo=;
	h=From:To:Cc:Subject:Date:From;
	b=qMh3s1D8ktW86wUo7On1Y6zcoAf5gVY1zcbbTttjoJufDFxdbgK4y+C57678SFr4/
	 bcYMWIorr8YcgaV4N+Z54SJSSuYoxmA43SRHYmCwVPqMOTQqUtLgS4Ph6gB4DEmh5G
	 6J5U0E2IdIhYmHHeM8LXLr0S1JW+OEt0FpY//6vDCKHFqQUfUw2ymypKCNMneFcItn
	 msmuQDlNLozdrWhlVq4i6XVDt7VApDMaRnqH48fDOCWPkAc5MjL8rI6LpPO/9Na/3O
	 OcguZxPhH1QD+URhYaLhPXBWeaYDT3SNEwslX/mDpZlvaMAUvMN7RKjX1UAUARcaZw
	 jpkdRVwivoE9w==
From: Kees Cook <kees@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <kees@kernel.org>,
	zepta <z3ptaa@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Thomas Andreatta <thomasandreatta2000@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: Fix stack buffer overflow in gmin_get_var_int()
Date: Thu, 24 Jul 2025 01:08:05 -0700
Message-Id: <20250724080756.work.741-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4056; i=kees@kernel.org; h=from:subject:message-id; bh=D109zUVaN75LJ2BDCN+vmyDZuBNjWIBhOr8sOZnfsJo=; b=owGbwMvMwCVmps19z/KJym7G02pJDBmNL5+wOE13WPr0yP9Ar9lyW8W43M+3zGhJjHcKcHNua 5E5+lyho5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCI9GYwMhyP+MR1QVy+XOvHx jMoCE8MetWnt9pwRG0Qe/KpyvHXKjZFhS9ZTrkyuiZtOrmvd6cmlnNSwMfWfrZ+N9Y2sbS2eRy2 5AQ==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

When gmin_get_config_var() calls efi.get_variable() and the EFI variable
is larger than the expected buffer size, two behaviors combine to create
a stack buffer overflow:

1. gmin_get_config_var() does not return the proper error code when
   efi.get_variable() fails. It returns the stale 'ret' value from
   earlier operations instead of indicating the EFI failure.

2. When efi.get_variable() returns EFI_BUFFER_TOO_SMALL, it updates
   *out_len to the required buffer size but writes no data to the output
   buffer. However, due to bug #1, gmin_get_var_int() believes the call
   succeeded.

The caller gmin_get_var_int() then performs:
- Allocates val[CFG_VAR_NAME_MAX + 1] (65 bytes) on stack
- Calls gmin_get_config_var(dev, is_gmin, var, val, &len) with len=64
- If EFI variable is >64 bytes, efi.get_variable() sets len=required_size
- Due to bug #1, thinks call succeeded with len=required_size
- Executes val[len] = 0, writing past end of 65-byte stack buffer

This creates a stack buffer overflow when EFI variables are larger than
64 bytes. Since EFI variables can be controlled by firmware or system
configuration, this could potentially be exploited for code execution.

Fix the bug by returning proper error codes from gmin_get_config_var()
based on EFI status instead of stale 'ret' value.

The gmin_get_var_int() function is called during device initialization
for camera sensor configuration on Intel Bay Trail and Cherry Trail
platforms using the atomisp camera stack.

Reported-by: zepta <z3ptaa@gmail.com>
Closes: https://lore.kernel.org/all/CAPBS6KoQyM7FMdPwOuXteXsOe44X4H3F8Fw+y_qWq6E+OdmxQA@mail.gmail.com
Fixes: 38d4f74bc148 ("media: atomisp_gmin_platform: stop abusing efivar API")
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: <linux-media@vger.kernel.org>
Cc: <linux-staging@lists.linux.dev>

Note that as an exercise this fix and the commit log body (I wrote the
tags) was entirely written by an LLM (and reviewed by me), though I really
had to help it focus on where to be looking. Here were my prompts:

Is there a buffer overflow problem associated with gmin_get_config_var()'s
use of efi.get_variable()?

What does efi.get_variable() do to out_len if it fails?

Does the function return an error when efi.get_variable fails?

What would the caller do when it sees a success but when efi.get_variable
changed out_len?

Propose fixes and write a commit message with all of the details you
just gave me about reachability, impact, etc.

Since the EFI_SUCCESS test ends with "return 0" you don't need an explicit
"else" block for the error path code.
---
 .../staging/media/atomisp/pci/atomisp_gmin_platform.c    | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 5f59519ac8e2..964cc3bcc0ac 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1272,14 +1272,15 @@ static int gmin_get_config_var(struct device *maindev,
 	if (efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE))
 		status = efi.get_variable(var16, &GMIN_CFG_VAR_EFI_GUID, NULL,
 					  (unsigned long *)out_len, out);
-	if (status == EFI_SUCCESS)
+	if (status == EFI_SUCCESS) {
 		dev_info(maindev, "found EFI entry for '%s'\n", var8);
-	else if (is_gmin)
+		return 0;
+	}
+	if (is_gmin)
 		dev_info(maindev, "Failed to find EFI gmin variable %s\n", var8);
 	else
 		dev_info(maindev, "Failed to find EFI variable %s\n", var8);
-
-	return ret;
+	return -ENOENT;
 }
 
 int gmin_get_var_int(struct device *dev, bool is_gmin, const char *var, int def)
-- 
2.34.1


