Return-Path: <linux-media+bounces-27624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2B5A4FFBC
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2005167067
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A891824CEEB;
	Wed,  5 Mar 2025 13:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M4BIWVGD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA9424C68D
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180013; cv=none; b=Ix9CYgK/Od59DLD56E6rKy7ZJ9tE6anGEb8FLwVoXbDRrnk94fh2uJ8B+NAl65kvhzYKIVSuYNsgSBIAxyR6lhE6nmAumm2xYwL3nJObbUDEhgbgGvI/imEbK0kgh05oR8fHVsiVntV5DlYFLWX7UIsWCsNbiPynu/qYLBfqy8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180013; c=relaxed/simple;
	bh=+8DfPloRk/O2wbK0yr6MftUtkn5813LmLNGOT0rjEEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p1mWo5GLjXkKXJQLf7Y6cvod+/nSYISZwaQB4hZGyULA3R3z6fkg0wOW+TID4atY0wKGpvP8gxf7YbDMo5/YVfWBlDMFuaZacebEcXCFaXGOey5vER81AJu++Nr/WWrE0ajJ4y8/e3YnrAyLolxLsUtmD7WO9fdPHpK2WHFuj8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M4BIWVGD; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5a346aeffso1091539a12.1
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 05:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741180009; x=1741784809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnKwjJ1FVLv4umx37hI66Bb7z/WCUlz7TSg/JWGf0qo=;
        b=M4BIWVGD6MXd/GtOebZS74XNIJyJxIYlSLY4MhBMTYk+38QFeHotrL4tgHLqwzaugJ
         86wFHaYY17+gypsttuhv0vmQQKQaYzx33MRGZsOiHpo40WccJQx0B0mtK6e8/T/BbaoO
         lOC5mINPSmtQpGOs0LKlxGziSzsdL22nATJ/yNlpLDU2LaTfyW1/GvgsmXCdTrhummrv
         QpaFBqdav0prdMu0aGesWoYJg+Nv/oxypR+DrT6xcdcvRV0ULLJqRiFp3DBDd8AfW920
         JWaSxn4DCyU7DnJEwCYZRIqkTE1aH3h6eiUJ/Wk7DmdnmTOWvexX+UQp+0JFmuffx6hN
         DnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180009; x=1741784809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnKwjJ1FVLv4umx37hI66Bb7z/WCUlz7TSg/JWGf0qo=;
        b=CLX3dwJhj3+bibdRuCF0RYHtkcucw8CWMw5GsBA78rD4pdmI/SfzqglwdpuxSksas8
         3lW1BkUMmJsy2j8NEBiJeGyTLGe27cvyGHR5hrxtg4nyUYODjXKpDpueptRx374sJWp3
         lAKePsPls2CzLK7kNur2ly/9E3G9E2/GblCL7F4MpPUYWASICXWChsPbFGbJhkocRAUC
         yeuxjImAdDHr0LfmAOO+3jVKfIzZaKcu7+el3pI1YOt0zODq2aGotrHcx4mRtlP3iWDC
         EIF6Q5nbMvx6ItdC6icrg9j3ah13nyPRP3SwSbg2fW5fb0pkPhfjht/UguunWIa4iEED
         90vg==
X-Forwarded-Encrypted: i=1; AJvYcCWXvbeNuRbad+fNTKnb5B+wdUhZPQg3vcvF6T8+qimglNzGOU8Z5we97muUt784u8Ik8T+lBF7ecl/zBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWnhgKRsICcetPrWu2lL/xSSB8vCYeURNG2BrLH/bNUR77XWH8
	XOnb8K5hNoBpX4Q+BMSeaDrJYmURnCyWc4Beapot3JAXzD5g/vsPzTIvy+j33aw=
X-Gm-Gg: ASbGncvZMPhl1fwfF0PJaiMHfb1GI6gMpeaGhpQVFbrUL2mT16GbxH7+yuDBg1V67yR
	VDi9Yf0X5pI0Y7R5SI8a0wTaOGhvmE0+ZTcC7sQL0w1JZil6AHmXV8l0/pHcNfOz3RY74VVGiZ4
	QARYPs6uMQFOHbVlzB9ErghEz2zLgLPIrZMTJxvJ0NyUTK1W2Um74PUfNux146clX3tDkYdli+m
	4+ZUgzeriHQJ1SYbOn6xLPzv2TAOjdUUkgyOWiopMtffyX50HHB5dQCZgnlehenwT50rvlw2ZXT
	I2hZn7qoV3rHmGcYtDLQcy0OJvGlOAvBmDxIm5FONnqTZWlzIrQYXff0vdyjMFN2QzRgfsAewOq
	Pp6NzgqpUzXvQAnU4yecBAw==
X-Google-Smtp-Source: AGHT+IFkv93UBCNyDTbp+dhfIHJd1mUccVi9lWn9kUXL6jjZpjjTaG6v7cqJg4o/sMmedLPajLbIUA==
X-Received: by 2002:a05:6402:2714:b0:5e5:437b:74a7 with SMTP id 4fb4d7f45d1cf-5e59f37c457mr2370034a12.8.1741180008509;
        Wed, 05 Mar 2025 05:06:48 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:06:46 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 03/10] optee: account for direction while converting parameters
Date: Wed,  5 Mar 2025 14:04:09 +0100
Message-ID: <20250305130634.1850178-4-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305130634.1850178-1-jens.wiklander@linaro.org>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OP-TEE backend driver has two internal function pointers to convert
between the subsystem type struct tee_param and the OP-TEE type struct
optee_msg_param.

The conversion is done from one of the types to the other, which is then
involved in some operation and finally converted back to the original
type. When converting to prepare the parameters for the operation, all
fields must be taken into account, but then converting back, it's enough
to update only out-values and out-sizes. So, an update_out parameter is
added to the conversion functions to tell if all or only some fields
must be copied.

This is needed in a later patch where it might get confusing when
converting back in from_msg_param() callback since an allocated
restricted SHM can be using the sec_world_id of the used restricted
memory pool and that doesn't translate back well.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/call.c          | 10 ++--
 drivers/tee/optee/ffa_abi.c       | 43 +++++++++++++----
 drivers/tee/optee/optee_private.h | 42 +++++++++++------
 drivers/tee/optee/rpc.c           | 31 +++++++++----
 drivers/tee/optee/smc_abi.c       | 76 +++++++++++++++++++++++--------
 5 files changed, 144 insertions(+), 58 deletions(-)

diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
index 16eb953e14bb..f1533b894726 100644
--- a/drivers/tee/optee/call.c
+++ b/drivers/tee/optee/call.c
@@ -400,7 +400,8 @@ int optee_open_session(struct tee_context *ctx,
 	export_uuid(msg_arg->params[1].u.octets, &client_uuid);
 
 	rc = optee->ops->to_msg_param(optee, msg_arg->params + 2,
-				      arg->num_params, param);
+				      arg->num_params, param,
+				      false /*!update_out*/);
 	if (rc)
 		goto out;
 
@@ -427,7 +428,8 @@ int optee_open_session(struct tee_context *ctx,
 	}
 
 	if (optee->ops->from_msg_param(optee, param, arg->num_params,
-				       msg_arg->params + 2)) {
+				       msg_arg->params + 2,
+				       true /*update_out*/)) {
 		arg->ret = TEEC_ERROR_COMMUNICATION;
 		arg->ret_origin = TEEC_ORIGIN_COMMS;
 		/* Close session again to avoid leakage */
@@ -541,7 +543,7 @@ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
 	msg_arg->cancel_id = arg->cancel_id;
 
 	rc = optee->ops->to_msg_param(optee, msg_arg->params, arg->num_params,
-				      param);
+				      param, false /*!update_out*/);
 	if (rc)
 		goto out;
 
@@ -551,7 +553,7 @@ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
 	}
 
 	if (optee->ops->from_msg_param(optee, param, arg->num_params,
-				       msg_arg->params)) {
+				       msg_arg->params, true /*update_out*/)) {
 		msg_arg->ret = TEEC_ERROR_COMMUNICATION;
 		msg_arg->ret_origin = TEEC_ORIGIN_COMMS;
 	}
diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index 4ca1d5161b82..e4b08cd195f3 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -122,15 +122,21 @@ static int optee_shm_rem_ffa_handle(struct optee *optee, u64 global_id)
  */
 
 static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param *p,
-				   u32 attr, const struct optee_msg_param *mp)
+				   u32 attr, const struct optee_msg_param *mp,
+				   bool update_out)
 {
 	struct tee_shm *shm = NULL;
 	u64 offs_high = 0;
 	u64 offs_low = 0;
 
+	if (update_out) {
+		if (attr == OPTEE_MSG_ATTR_TYPE_FMEM_INPUT)
+			return;
+		goto out;
+	}
+
 	p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
 		  attr - OPTEE_MSG_ATTR_TYPE_FMEM_INPUT;
-	p->u.memref.size = mp->u.fmem.size;
 
 	if (mp->u.fmem.global_id != OPTEE_MSG_FMEM_INVALID_GLOBAL_ID)
 		shm = optee_shm_from_ffa_handle(optee, mp->u.fmem.global_id);
@@ -141,6 +147,8 @@ static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param *p,
 		offs_high = mp->u.fmem.offs_high;
 	}
 	p->u.memref.shm_offs = offs_low | offs_high << 32;
+out:
+	p->u.memref.size = mp->u.fmem.size;
 }
 
 /**
@@ -150,12 +158,14 @@ static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param *p,
  * @params:	subsystem internal parameter representation
  * @num_params:	number of elements in the parameter arrays
  * @msg_params:	OPTEE_MSG parameters
+ * @update_out: update parameter for output only
  *
  * Returns 0 on success or <0 on failure
  */
 static int optee_ffa_from_msg_param(struct optee *optee,
 				    struct tee_param *params, size_t num_params,
-				    const struct optee_msg_param *msg_params)
+				    const struct optee_msg_param *msg_params,
+				    bool update_out)
 {
 	size_t n;
 
@@ -166,18 +176,20 @@ static int optee_ffa_from_msg_param(struct optee *optee,
 
 		switch (attr) {
 		case OPTEE_MSG_ATTR_TYPE_NONE:
+			if (update_out)
+				break;
 			p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
 			memset(&p->u, 0, sizeof(p->u));
 			break;
 		case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
 		case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
 		case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
-			optee_from_msg_param_value(p, attr, mp);
+			optee_from_msg_param_value(p, attr, mp, update_out);
 			break;
 		case OPTEE_MSG_ATTR_TYPE_FMEM_INPUT:
 		case OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT:
 		case OPTEE_MSG_ATTR_TYPE_FMEM_INOUT:
-			from_msg_param_ffa_mem(optee, p, attr, mp);
+			from_msg_param_ffa_mem(optee, p, attr, mp, update_out);
 			break;
 		default:
 			return -EINVAL;
@@ -188,10 +200,16 @@ static int optee_ffa_from_msg_param(struct optee *optee,
 }
 
 static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
-				const struct tee_param *p)
+				const struct tee_param *p, bool update_out)
 {
 	struct tee_shm *shm = p->u.memref.shm;
 
+	if (update_out) {
+		if (p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT)
+			return 0;
+		goto out;
+	}
+
 	mp->attr = OPTEE_MSG_ATTR_TYPE_FMEM_INPUT + p->attr -
 		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
 
@@ -211,6 +229,7 @@ static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
 		memset(&mp->u, 0, sizeof(mp->u));
 		mp->u.fmem.global_id = OPTEE_MSG_FMEM_INVALID_GLOBAL_ID;
 	}
+out:
 	mp->u.fmem.size = p->u.memref.size;
 
 	return 0;
@@ -222,13 +241,15 @@ static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
  * @optee:	main service struct
  * @msg_params:	OPTEE_MSG parameters
  * @num_params:	number of elements in the parameter arrays
- * @params:	subsystem itnernal parameter representation
+ * @params:	subsystem internal parameter representation
+ * @update_out: update parameter for output only
  * Returns 0 on success or <0 on failure
  */
 static int optee_ffa_to_msg_param(struct optee *optee,
 				  struct optee_msg_param *msg_params,
 				  size_t num_params,
-				  const struct tee_param *params)
+				  const struct tee_param *params,
+				  bool update_out)
 {
 	size_t n;
 
@@ -238,18 +259,20 @@ static int optee_ffa_to_msg_param(struct optee *optee,
 
 		switch (p->attr) {
 		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
+			if (update_out)
+				break;
 			mp->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
 			memset(&mp->u, 0, sizeof(mp->u));
 			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
-			optee_to_msg_param_value(mp, p);
+			optee_to_msg_param_value(mp, p, update_out);
 			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
-			if (to_msg_param_ffa_mem(mp, p))
+			if (to_msg_param_ffa_mem(mp, p, update_out))
 				return -EINVAL;
 			break;
 		default:
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index dc0f355ef72a..20eda508dbac 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -185,10 +185,12 @@ struct optee_ops {
 				bool system_thread);
 	int (*to_msg_param)(struct optee *optee,
 			    struct optee_msg_param *msg_params,
-			    size_t num_params, const struct tee_param *params);
+			    size_t num_params, const struct tee_param *params,
+			    bool update_out);
 	int (*from_msg_param)(struct optee *optee, struct tee_param *params,
 			      size_t num_params,
-			      const struct optee_msg_param *msg_params);
+			      const struct optee_msg_param *msg_params,
+			      bool update_out);
 };
 
 /**
@@ -316,23 +318,35 @@ void optee_release(struct tee_context *ctx);
 void optee_release_supp(struct tee_context *ctx);
 
 static inline void optee_from_msg_param_value(struct tee_param *p, u32 attr,
-					      const struct optee_msg_param *mp)
+					      const struct optee_msg_param *mp,
+					      bool update_out)
 {
-	p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
-		  attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
-	p->u.value.a = mp->u.value.a;
-	p->u.value.b = mp->u.value.b;
-	p->u.value.c = mp->u.value.c;
+	if (!update_out)
+		p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
+			  attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
+
+	if (attr == OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT ||
+	    attr == OPTEE_MSG_ATTR_TYPE_VALUE_INOUT || !update_out) {
+		p->u.value.a = mp->u.value.a;
+		p->u.value.b = mp->u.value.b;
+		p->u.value.c = mp->u.value.c;
+	}
 }
 
 static inline void optee_to_msg_param_value(struct optee_msg_param *mp,
-					    const struct tee_param *p)
+					    const struct tee_param *p,
+					    bool update_out)
 {
-	mp->attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->attr -
-		   TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
-	mp->u.value.a = p->u.value.a;
-	mp->u.value.b = p->u.value.b;
-	mp->u.value.c = p->u.value.c;
+	if (!update_out)
+		mp->attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->attr -
+			   TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+
+	if (p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT ||
+	    p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT || !update_out) {
+		mp->u.value.a = p->u.value.a;
+		mp->u.value.b = p->u.value.b;
+		mp->u.value.c = p->u.value.c;
+	}
 }
 
 void optee_cq_init(struct optee_call_queue *cq, int thread_count);
diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
index ebbbd42b0e3e..580e6b9b0606 100644
--- a/drivers/tee/optee/rpc.c
+++ b/drivers/tee/optee/rpc.c
@@ -63,7 +63,7 @@ static void handle_rpc_func_cmd_i2c_transfer(struct tee_context *ctx,
 	}
 
 	if (optee->ops->from_msg_param(optee, params, arg->num_params,
-				       arg->params))
+				       arg->params, false /*!update_out*/))
 		goto bad;
 
 	for (i = 0; i < arg->num_params; i++) {
@@ -107,7 +107,8 @@ static void handle_rpc_func_cmd_i2c_transfer(struct tee_context *ctx,
 	} else {
 		params[3].u.value.a = msg.len;
 		if (optee->ops->to_msg_param(optee, arg->params,
-					     arg->num_params, params))
+					     arg->num_params, params,
+					     true /*update_out*/))
 			arg->ret = TEEC_ERROR_BAD_PARAMETERS;
 		else
 			arg->ret = TEEC_SUCCESS;
@@ -188,6 +189,7 @@ static void handle_rpc_func_cmd_wait(struct optee_msg_arg *arg)
 static void handle_rpc_supp_cmd(struct tee_context *ctx, struct optee *optee,
 				struct optee_msg_arg *arg)
 {
+	bool update_out = false;
 	struct tee_param *params;
 
 	arg->ret_origin = TEEC_ORIGIN_COMMS;
@@ -200,15 +202,21 @@ static void handle_rpc_supp_cmd(struct tee_context *ctx, struct optee *optee,
 	}
 
 	if (optee->ops->from_msg_param(optee, params, arg->num_params,
-				       arg->params)) {
+				       arg->params, update_out)) {
 		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
 		goto out;
 	}
 
 	arg->ret = optee_supp_thrd_req(ctx, arg->cmd, arg->num_params, params);
 
+	/*
+	 * Special treatment for OPTEE_RPC_CMD_SHM_ALLOC since input is a
+	 * value type, but the output is a memref type.
+	 */
+	if (arg->cmd != OPTEE_RPC_CMD_SHM_ALLOC)
+		update_out = true;
 	if (optee->ops->to_msg_param(optee, arg->params, arg->num_params,
-				     params))
+				     params, update_out))
 		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
 out:
 	kfree(params);
@@ -270,7 +278,7 @@ static void handle_rpc_func_rpmb_probe_reset(struct tee_context *ctx,
 
 	if (arg->num_params != ARRAY_SIZE(params) ||
 	    optee->ops->from_msg_param(optee, params, arg->num_params,
-				       arg->params) ||
+				       arg->params, false /*!update_out*/) ||
 	    params[0].attr != TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT) {
 		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
 		return;
@@ -280,7 +288,8 @@ static void handle_rpc_func_rpmb_probe_reset(struct tee_context *ctx,
 	params[0].u.value.b = 0;
 	params[0].u.value.c = 0;
 	if (optee->ops->to_msg_param(optee, arg->params,
-				     arg->num_params, params)) {
+				     arg->num_params, params,
+				     true /*update_out*/)) {
 		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
 		return;
 	}
@@ -324,7 +333,7 @@ static void handle_rpc_func_rpmb_probe_next(struct tee_context *ctx,
 
 	if (arg->num_params != ARRAY_SIZE(params) ||
 	    optee->ops->from_msg_param(optee, params, arg->num_params,
-				       arg->params) ||
+				       arg->params, false /*!update_out*/) ||
 	    params[0].attr != TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT ||
 	    params[1].attr != TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT) {
 		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
@@ -358,7 +367,8 @@ static void handle_rpc_func_rpmb_probe_next(struct tee_context *ctx,
 	params[0].u.value.b = rdev->descr.capacity;
 	params[0].u.value.c = rdev->descr.reliable_wr_count;
 	if (optee->ops->to_msg_param(optee, arg->params,
-				     arg->num_params, params)) {
+				     arg->num_params, params,
+				     true /*update_out*/)) {
 		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
 		return;
 	}
@@ -384,7 +394,7 @@ static void handle_rpc_func_rpmb_frames(struct tee_context *ctx,
 
 	if (arg->num_params != ARRAY_SIZE(params) ||
 	    optee->ops->from_msg_param(optee, params, arg->num_params,
-				       arg->params) ||
+				       arg->params, false /*!update_out*/) ||
 	    params[0].attr != TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT ||
 	    params[1].attr != TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT) {
 		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
@@ -401,7 +411,8 @@ static void handle_rpc_func_rpmb_frames(struct tee_context *ctx,
 		goto out;
 	}
 	if (optee->ops->to_msg_param(optee, arg->params,
-				     arg->num_params, params)) {
+				     arg->num_params, params,
+				     true /*update_out*/)) {
 		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
 		goto out;
 	}
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index 165fadd9abc9..cfdae266548b 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -81,20 +81,26 @@ static int optee_cpuhp_disable_pcpu_irq(unsigned int cpu)
  */
 
 static int from_msg_param_tmp_mem(struct tee_param *p, u32 attr,
-				  const struct optee_msg_param *mp)
+				  const struct optee_msg_param *mp,
+				  bool update_out)
 {
 	struct tee_shm *shm;
 	phys_addr_t pa;
 	int rc;
 
+	if (update_out) {
+		if (attr == OPTEE_MSG_ATTR_TYPE_TMEM_INPUT)
+			return 0;
+		goto out;
+	}
+
 	p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
 		  attr - OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
-	p->u.memref.size = mp->u.tmem.size;
 	shm = (struct tee_shm *)(unsigned long)mp->u.tmem.shm_ref;
 	if (!shm) {
 		p->u.memref.shm_offs = 0;
 		p->u.memref.shm = NULL;
-		return 0;
+		goto out;
 	}
 
 	rc = tee_shm_get_pa(shm, 0, &pa);
@@ -103,18 +109,25 @@ static int from_msg_param_tmp_mem(struct tee_param *p, u32 attr,
 
 	p->u.memref.shm_offs = mp->u.tmem.buf_ptr - pa;
 	p->u.memref.shm = shm;
-
+out:
+	p->u.memref.size = mp->u.tmem.size;
 	return 0;
 }
 
 static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
-				   const struct optee_msg_param *mp)
+				   const struct optee_msg_param *mp,
+				   bool update_out)
 {
 	struct tee_shm *shm;
 
+	if (update_out) {
+		if (attr == OPTEE_MSG_ATTR_TYPE_RMEM_INPUT)
+			return;
+		goto out;
+	}
+
 	p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
 		  attr - OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
-	p->u.memref.size = mp->u.rmem.size;
 	shm = (struct tee_shm *)(unsigned long)mp->u.rmem.shm_ref;
 
 	if (shm) {
@@ -124,6 +137,8 @@ static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
 		p->u.memref.shm_offs = 0;
 		p->u.memref.shm = NULL;
 	}
+out:
+	p->u.memref.size = mp->u.rmem.size;
 }
 
 /**
@@ -133,11 +148,13 @@ static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
  * @params:	subsystem internal parameter representation
  * @num_params:	number of elements in the parameter arrays
  * @msg_params:	OPTEE_MSG parameters
+ * @update_out:	update parameter for output only
  * Returns 0 on success or <0 on failure
  */
 static int optee_from_msg_param(struct optee *optee, struct tee_param *params,
 				size_t num_params,
-				const struct optee_msg_param *msg_params)
+				const struct optee_msg_param *msg_params,
+				bool update_out)
 {
 	int rc;
 	size_t n;
@@ -149,25 +166,27 @@ static int optee_from_msg_param(struct optee *optee, struct tee_param *params,
 
 		switch (attr) {
 		case OPTEE_MSG_ATTR_TYPE_NONE:
+			if (update_out)
+				break;
 			p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
 			memset(&p->u, 0, sizeof(p->u));
 			break;
 		case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
 		case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
 		case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
-			optee_from_msg_param_value(p, attr, mp);
+			optee_from_msg_param_value(p, attr, mp, update_out);
 			break;
 		case OPTEE_MSG_ATTR_TYPE_TMEM_INPUT:
 		case OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT:
 		case OPTEE_MSG_ATTR_TYPE_TMEM_INOUT:
-			rc = from_msg_param_tmp_mem(p, attr, mp);
+			rc = from_msg_param_tmp_mem(p, attr, mp, update_out);
 			if (rc)
 				return rc;
 			break;
 		case OPTEE_MSG_ATTR_TYPE_RMEM_INPUT:
 		case OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT:
 		case OPTEE_MSG_ATTR_TYPE_RMEM_INOUT:
-			from_msg_param_reg_mem(p, attr, mp);
+			from_msg_param_reg_mem(p, attr, mp, update_out);
 			break;
 
 		default:
@@ -178,20 +197,25 @@ static int optee_from_msg_param(struct optee *optee, struct tee_param *params,
 }
 
 static int to_msg_param_tmp_mem(struct optee_msg_param *mp,
-				const struct tee_param *p)
+				const struct tee_param *p, bool update_out)
 {
 	int rc;
 	phys_addr_t pa;
 
+	if (update_out) {
+		if (p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT)
+			return 0;
+		goto out;
+	}
+
 	mp->attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT + p->attr -
 		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
 
 	mp->u.tmem.shm_ref = (unsigned long)p->u.memref.shm;
-	mp->u.tmem.size = p->u.memref.size;
 
 	if (!p->u.memref.shm) {
 		mp->u.tmem.buf_ptr = 0;
-		return 0;
+		goto out;
 	}
 
 	rc = tee_shm_get_pa(p->u.memref.shm, p->u.memref.shm_offs, &pa);
@@ -201,19 +225,27 @@ static int to_msg_param_tmp_mem(struct optee_msg_param *mp,
 	mp->u.tmem.buf_ptr = pa;
 	mp->attr |= OPTEE_MSG_ATTR_CACHE_PREDEFINED <<
 		    OPTEE_MSG_ATTR_CACHE_SHIFT;
-
+out:
+	mp->u.tmem.size = p->u.memref.size;
 	return 0;
 }
 
 static int to_msg_param_reg_mem(struct optee_msg_param *mp,
-				const struct tee_param *p)
+				const struct tee_param *p, bool update_out)
 {
+	if (update_out) {
+		if (p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT)
+			return 0;
+		goto out;
+	}
+
 	mp->attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT + p->attr -
 		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
 
 	mp->u.rmem.shm_ref = (unsigned long)p->u.memref.shm;
-	mp->u.rmem.size = p->u.memref.size;
 	mp->u.rmem.offs = p->u.memref.shm_offs;
+out:
+	mp->u.rmem.size = p->u.memref.size;
 	return 0;
 }
 
@@ -223,11 +255,13 @@ static int to_msg_param_reg_mem(struct optee_msg_param *mp,
  * @msg_params:	OPTEE_MSG parameters
  * @num_params:	number of elements in the parameter arrays
  * @params:	subsystem itnernal parameter representation
+ * @update_out:	update parameter for output only
  * Returns 0 on success or <0 on failure
  */
 static int optee_to_msg_param(struct optee *optee,
 			      struct optee_msg_param *msg_params,
-			      size_t num_params, const struct tee_param *params)
+			      size_t num_params, const struct tee_param *params,
+			      bool update_out)
 {
 	int rc;
 	size_t n;
@@ -238,21 +272,23 @@ static int optee_to_msg_param(struct optee *optee,
 
 		switch (p->attr) {
 		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
+			if (update_out)
+				break;
 			mp->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
 			memset(&mp->u, 0, sizeof(mp->u));
 			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
-			optee_to_msg_param_value(mp, p);
+			optee_to_msg_param_value(mp, p, update_out);
 			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
 			if (tee_shm_is_dynamic(p->u.memref.shm))
-				rc = to_msg_param_reg_mem(mp, p);
+				rc = to_msg_param_reg_mem(mp, p, update_out);
 			else
-				rc = to_msg_param_tmp_mem(mp, p);
+				rc = to_msg_param_tmp_mem(mp, p, update_out);
 			if (rc)
 				return rc;
 			break;
-- 
2.43.0


