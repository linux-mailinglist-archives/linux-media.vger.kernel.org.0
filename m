Return-Path: <linux-media+bounces-52793-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLixKSrKj2nMTgEAu9opvQ
	(envelope-from <linux-media+bounces-52793-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:04:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDE813A579
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:04:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C37E13011101
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 01:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF6F1E1E12;
	Sat, 14 Feb 2026 01:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1wWoKnZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF377194098;
	Sat, 14 Feb 2026 01:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771031056; cv=none; b=UJAIoEPR1KDpYa83K2Msuia//GZ+/x+BHvc+GtisSF2DRKqiK7XE3Y4qXC+YtxZnAAiIvOqCE/XCHsXFK0t4FOek4Dmx8E+zLTHwXyXEL+BFZfhHvKFB96s1DAMX58bj6dnRhLcOvCzxIZfB0tvzN5vsvPeCDkaq13hLkG7315M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771031056; c=relaxed/simple;
	bh=f7dNVhnQxuS+2EpCYERN03CB3MKHM5W5fa7IgT7GWXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BWhilxM1oxObbNDIto28BFiT1o5gdQ9y0grZFOd1BEauyHOOdDOZTbru3s2mxj7bCaBXMR8Dfu+iNatKAAjCoJtFxIXI9sHKTbBX6BoQ18ew66D164vyAMCj7l5PCMLocSGszXSFSqCai4EQKmvswpAe2yQ1CyWJrU5R4awqLxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1wWoKnZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F06EC116C6;
	Sat, 14 Feb 2026 01:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031056;
	bh=f7dNVhnQxuS+2EpCYERN03CB3MKHM5W5fa7IgT7GWXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N1wWoKnZ4ZgYFGtyxdhNK9EJNlCPdIs3YVbm3RswwQQPDl2DecM02btPX3ujiLiIJ
	 8qPCNlEaj9zKPRV73yDRqPCmLtw0N8tB+ZcXml7fVhg102d6MKmOKmaTtkQWPkqC0P
	 zHdKH13GPLI0qLM/27K5wXj6KMab0w2uf8OrIfvwJH7ICKmoPb7SkGlFy2jPn7Jhaf
	 gjttPe/BET12CZcG82fdy5CtS8OZCnkTYRBYcGvCAY5rRLlGFhfDSM3zkzMHeCm5sA
	 WO0898dIHNkrYATAqGO20sUCor4DRF2Q898J4UUzMQI14Tnf5CHFUwvhc8Gwk/332B
	 ZQ1aBmSWRBjIA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Yew, Chang Ching" <chang.ching.yew@intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.6] media: v4l2-async: Fix error handling on steps after finding a match
Date: Fri, 13 Feb 2026 19:58:42 -0500
Message-ID: <20260214010245.3671907-42-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-52793-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 0CDE813A579
X-Rspamd-Action: no action

From: Sakari Ailus <sakari.ailus@linux.intel.com>

[ Upstream commit 7345d6d356336c448d6b9230ed8704f39679fd12 ]

Once an async connection is found to be matching with an fwnode, a
sub-device may be registered (in case it wasn't already), its bound
operation is called, ancillary links are created, the async connection
is added to the sub-device's list of connections and removed from the
global waiting connection list. Further on, the sub-device's possible own
notifier is searched for possible additional matches.

Fix these specific issues:

- If v4l2_async_match_notify() failed before the sub-notifier handling,
  the async connection was unbound and its entry removed from the
  sub-device's async connection list. The latter part was also done in
  v4l2_async_match_notify().

- The async connection's sd field was only set after creating ancillary
  links in v4l2_async_match_notify(). It was however dereferenced in
  v4l2_async_unbind_subdev_one(), which was called on error path of
  v4l2_async_match_notify() failure.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: "Yew, Chang Ching" <chang.ching.yew@intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of media: v4l2-async: Fix error handling on steps after
finding a match

### 1. COMMIT MESSAGE ANALYSIS

The subject explicitly says "Fix error handling" — this is a bug fix.
The commit message describes two specific issues:

1. **Double cleanup of async connection list entry**: When
   `v4l2_async_match_notify()` failed before sub-notifier handling, the
   async connection was unbound and its entry removed from the sub-
   device's async connection list *twice* — once inside
   `v4l2_async_match_notify()` and once in the caller's error path.

2. **NULL pointer dereference**: The `asc->sd` field was only set
   *after* creating ancillary links, but
   `v4l2_async_unbind_subdev_one()` (called on the error path)
   dereferences `asc->sd`. If `v4l2_async_match_notify()` failed before
   `asc->sd` was assigned, this would cause a NULL pointer dereference.

These are real bugs — a double list_del (list corruption) and a NULL
pointer dereference (crash).

### 2. CODE CHANGE ANALYSIS

The patch restructures `v4l2_async_match_notify()` by:

**a) Splitting the function**: The sub-notifier discovery logic is
extracted into a new function `v4l2_async_nf_try_subdev_notifier()`.
This separates concerns so that `v4l2_async_match_notify()` handles only
the matching/binding, and the sub-notifier logic is called separately by
the caller.

**b) Fixing error paths in `v4l2_async_match_notify()`**:
- The error labels are moved to *after* the success return (`return 0`),
  ensuring that on success the function returns cleanly without falling
  through to error handling.
- The `err_call_unbind` label properly calls
  `v4l2_async_nf_call_unbind()` and removes the list entry.
- The `err_unregister_subdev` label only unregisters if `registered` is
  true.
- Crucially, `asc->sd` is set *before* the error labels, so
  `v4l2_async_unbind_subdev_one()` in the caller won't dereference NULL.

**c) Fixing caller error handling in `__v4l2_async_register_subdev()`**:
- New error labels: `err_unlock` (just unlocks mutex) and
  `err_unbind_one` (unbinds single connection).
- If `v4l2_async_match_notify()` fails, it jumps to `err_unlock` — the
  function already cleaned up internally.
- If `v4l2_async_nf_try_subdev_notifier()` fails, it jumps to
  `err_unbind_one`.
- If `v4l2_async_nf_try_complete()` fails, it jumps to `err_unbind`
  (full unbind).
- The redundant `if (asc)` check is removed since `asc` is always valid
  at that point.

**d) Same pattern in `v4l2_async_nf_try_all_subdevs()`**: The sub-
notifier call is now done separately after `v4l2_async_match_notify()`.

### 3. BUG CLASSIFICATION

- **NULL pointer dereference**: `asc->sd` dereferenced when NULL — this
  is a crash bug.
- **List corruption / double cleanup**: Removing an entry from a list
  twice can corrupt the list, leading to crashes or undefined behavior.

Both are serious bugs that can cause kernel crashes.

### 4. SCOPE AND RISK ASSESSMENT

- **Files changed**: 1 file (`drivers/media/v4l2-core/v4l2-async.c`)
- **Nature of changes**: Refactoring a function into two pieces and
  fixing error handling labels
- **Lines changed**: Moderate (~80 lines of diff), but the logic changes
  are focused on error paths
- **Risk**: Medium — the refactoring is non-trivial as it splits a
  function and changes error flow in two call sites. However, the logic
  is straightforward and the changes are well-contained.

### 5. USER IMPACT

The V4L2 async framework is used by many camera/media subsystems,
especially on embedded platforms (ARM SoCs with ISPs). The bugs are
triggered on error paths during device probe, which can happen when:
- Hardware initialization fails
- Firmware nodes don't match properly
- Resource allocation fails

This affects embedded/SoC users running stable kernels (Android,
embedded Linux).

### 6. STABILITY INDICATORS

- **Tested-by**: "Yew, Chang Ching" — indicates real testing
- **Author**: Sakari Ailus — a well-known V4L2/media subsystem
  maintainer
- **Signed-off by**: Hans Verkuil — the V4L2 subsystem maintainer
- Both bugs are clearly identified and the fix is logical

### 7. DEPENDENCY CHECK

The patch is self-contained within `v4l2-async.c`. It refactors existing
code rather than depending on new APIs. The main concern would be
whether the code being patched exists in older stable trees in the same
form. The `v4l2_async_connection` type and the specific function
signatures suggest this is relatively recent code, but the fix should
apply to any tree containing these functions.

### 8. CONCERNS

- The patch is somewhat large due to the function extraction, not just a
  simple one-liner. However, the refactoring is necessary to properly
  separate the error handling concerns.
- The function split makes the error handling cleaner and more correct,
  which is exactly what stable trees need.
- The changes need careful backporting review to ensure they apply
  cleanly to each target stable tree.

### CONCLUSION

This commit fixes two real bugs: a NULL pointer dereference and a double
list cleanup (list corruption). Both can cause kernel crashes. The fix
is authored and reviewed by the V4L2 subsystem maintainers, has been
tested, and is contained to a single file. While the patch is moderately
sized due to the function extraction, the changes are logically sound
and necessary to fix the error handling properly. The bugs affect real
embedded/media users.

**YES**

 drivers/media/v4l2-core/v4l2-async.c | 45 +++++++++++++++++++---------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index ee884a8221fbd..1c08bba9ecb91 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -343,7 +343,6 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 				   struct v4l2_subdev *sd,
 				   struct v4l2_async_connection *asc)
 {
-	struct v4l2_async_notifier *subdev_notifier;
 	bool registered = false;
 	int ret;
 
@@ -389,6 +388,25 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 	dev_dbg(notifier_dev(notifier), "v4l2-async: %s bound (ret %d)\n",
 		dev_name(sd->dev), ret);
 
+	return 0;
+
+err_call_unbind:
+	v4l2_async_nf_call_unbind(notifier, sd, asc);
+	list_del(&asc->asc_subdev_entry);
+
+err_unregister_subdev:
+	if (registered)
+		v4l2_device_unregister_subdev(sd);
+
+	return ret;
+}
+
+static int
+v4l2_async_nf_try_subdev_notifier(struct v4l2_async_notifier *notifier,
+				  struct v4l2_subdev *sd)
+{
+	struct v4l2_async_notifier *subdev_notifier;
+
 	/*
 	 * See if the sub-device has a notifier. If not, return here.
 	 */
@@ -404,16 +422,6 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 	subdev_notifier->parent = notifier;
 
 	return v4l2_async_nf_try_all_subdevs(subdev_notifier);
-
-err_call_unbind:
-	v4l2_async_nf_call_unbind(notifier, sd, asc);
-	list_del(&asc->asc_subdev_entry);
-
-err_unregister_subdev:
-	if (registered)
-		v4l2_device_unregister_subdev(sd);
-
-	return ret;
 }
 
 /* Test all async sub-devices in a notifier for a match. */
@@ -445,6 +453,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier)
 		if (ret < 0)
 			return ret;
 
+		ret = v4l2_async_nf_try_subdev_notifier(notifier, sd);
+		if (ret < 0)
+			return ret;
+
 		/*
 		 * v4l2_async_match_notify() may lead to registering a
 		 * new notifier and thus changing the async subdevs
@@ -829,7 +841,11 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module)
 			ret = v4l2_async_match_notify(notifier, v4l2_dev, sd,
 						      asc);
 			if (ret)
-				goto err_unbind;
+				goto err_unlock;
+
+			ret = v4l2_async_nf_try_subdev_notifier(notifier, sd);
+			if (ret)
+				goto err_unbind_one;
 
 			ret = v4l2_async_nf_try_complete(notifier);
 			if (ret)
@@ -853,9 +869,10 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module)
 	if (subdev_notifier)
 		v4l2_async_nf_unbind_all_subdevs(subdev_notifier);
 
-	if (asc)
-		v4l2_async_unbind_subdev_one(notifier, asc);
+err_unbind_one:
+	v4l2_async_unbind_subdev_one(notifier, asc);
 
+err_unlock:
 	mutex_unlock(&list_lock);
 
 	sd->owner = NULL;
-- 
2.51.0


