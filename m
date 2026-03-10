Return-Path: <linux-media+bounces-55241-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBggOr2PsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55241-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:40:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD2625866F
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDC1F31BD0E9
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EF13EE1FD;
	Tue, 10 Mar 2026 21:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="a9dsu/Ky"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic307-54.consmr.mail.ir2.yahoo.com (sonic307-54.consmr.mail.ir2.yahoo.com [87.248.110.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598DA3DDDA5
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773178762; cv=none; b=ZCPuyOLe8IXeCiSRwHFjLiPDsYtS/yVupAneFcab3StRAILd+tIN26EOMLlP72avuYIK3QoDiz5x1uRlhNL+iN5pchyMvOwyHUwZQ/y5Ik4BzLWlylLLAH1EVlsirQxAeiBcX9paB9O508L/p/h5dMsO1WAAJ00wdBFNKdJPXvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773178762; c=relaxed/simple;
	bh=XyWA06T3kBzBTCVI4Dk8yjTCqzr5WhEB0SqMVvRSaEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZtAk5ogMNxSJX0MYaRZiCLbqmSQtrlg9EQUw3XX9iojpmMNMpIGZ4++E6Y+T0HOGj2LSSHmS96lvlp8VyTfy1Qfoz2eCK/HyDZ5Q/iA9AwPwP/VmA1ydYaouo1oasDJLa8J6qQVgegBDJCo+JW5RMGvhSjMQaGf6KbhFluoMy+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=a9dsu/Ky; arc=none smtp.client-ip=87.248.110.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773178758; bh=tkSIY6DaKpcZ+5HhblGa1osVp7c64xHZgsVK48nuR5E=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=a9dsu/KyRWgn5zsMMBihrS9WBfej+McVVeLxoMMp9bJPEaVxrCNUcBbaDQRz1k1754apGzJExlZgiBgIMMwRzxi0eqk6rtIpFXHjuAuo+L92ReOHc1voGdRE6dAdVzeAWy5jZKjZVsHQSW/zAaAR7tyei4B0WLLrXKdGXzfQ9+j6lONJlugHJDvyly30OcEm6hqCjqUZ2PLiJWas+VhJVUqpxsoWxy/sg6ds1XM0RgraHLGMaCu+bcGOSA5vRqf3HsDK55eGZAT2F3i2VifKKT6TrDaHg9ZZsYbGB4/ZqQS/lESnQa/pPTp7tttsCiFdkSWGi/qubV1kqbuKGE/0ag==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773178758; bh=P73FRVyrLCRWJ1sLPA43HSGELkSsqaj+HkAnxcETkQY=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=Ot5751CLzkrShwc9h4Pr6lbXbDNgMcLcXJsqEmAWbBWR2M+ejzZVLJUW1OeKBQhYbRuNXOVqEBOAxH1xUH2AtMAReMS1Hz+OeVqjaAAGQu3iOlagy7iIGzxLyqVfpAcd7gh/G5QTnLQ5bCoxMhDvQagVpFwem9cGhunbuBJ2aZ9VHhjtvqxBfaDCdkWpza9Tgh97kdX9TPoySjVLT9DfOj2hb+lDqGEBaxl0OgcBq0iP9oUsSoYmCanYyDnEhqdvegkQe87+PSooS2RZKcWI2+CT/lT2F7ZHfcbTdBShu3qDhCKnfDivKkSdtMF2q5GByWMYPrIy2qZ6yeOx/Cd3CA==
X-YMail-OSG: p7FydHIVM1mNiDpLiGv0kCbGRix4fN4B.Xj9RrQ3NnDJycR15vAT0RrRY1gjgOf
 OVvrTvDXEnFsSOg4VTMQdAWgF5LmSGsSUh.6Pyajd9psxK4YbnsrvDDvvTCI4qcm5QuCekORu99a
 LCxh.uvdjJZO_kmNa9KM4d6Ivdi10dl4zgO6oXTR0cWG4z8wFLIzdCQi3AXrR9x_.fTOZIfsSYo2
 28l_3YcWAwkTaMbP8tBa6NBpaTssHr2YAqQ4s7bepwenFF.2y51W2fgVs7GlHwDflsdikg6wG8D6
 WqlXY5EMZ0.0nB0cqhhhAjZIW4qctKaGN26VDx4A9EDTc47vUST30nqVfZYW7y8sPo1gEmOdY0zz
 04rO0mJ91kbTe5vRnSp4Pcx6Sa0ShfLggJucpPuvin2Z17VaEorP9UMRuLusiwTrRYkD8wRe5Qx7
 lbkbQ1mXxKQC.JkUZ1Y4ODiEjG95bws_aGAB5tYYQHAsFKsquIhW3npGGA2eB8gxVeGQFkB64YgO
 zMtZJu__wIINBGA5__V_8GBy.ruSQeYQMhwgWI5ZFBUfCIuBny.7owxN9jIXuIZel1LYYYSJLxd.
 V6ksFxSiENud2Mt2tHRcWDUGnf7zS2m86dEfz6HWbmVb9aBSCk7cyv55WvgqgfqI8DEAZMzSFTm7
 fpkMcXvAm_9bbFLToIXc8rlSrSzAn0w6zMGOd3Yh8IbMriGLjjuRv9ujLhDOfKmeKc0FRD_6PnBi
 ANf2f.9tSoXdOUDNgJpDIxO.ljUDBkTb1uP3DZnjGJcL1gLdL1_e7lwFRs1I.Ofp4pC.q_b6zJsI
 Grongx70QExkLL3XCeJKMumtVHPMvZNLdZmIhgj9vc5j7f5ByghTA5rmn6BRJ6M6Rj9d9WikAXur
 L8LV3TFlI9RMF8Sq2e5pkcHNyjvp3spDdAoKBFZpSpq4iM8En4Ln6.WY2rtUf_gXr7TL7k4jkbD4
 ERTuQ7p7WEpIUkB3u._jtq11Tb_3h544r2ea_5JbItjYRGf4ff9H_555lSSCWEZP1253KLOrQ.Es
 Yb75I.Rziiw38tlRfp7kIFDPIhEACQm4V.O0y5R0yT9CC6yUAGjXcKCixxTGrIMoCUcV15aSEyJA
 REAGZRxNXAZKs9lHt3IrqZRKtRFjPweVjOr2MLCb9kLHL4Q3sgrWxx1EIhWtyQlM0KjB_e8gXTx2
 pfOmGV8ENGhIUoyz6bPDODbPmMqiG.iKU6ejGulIRLAOhMUUBwXBqfakEzQngNynUG.PGbEuo5sg
 W5Y4.m3rFEo3QD.yXKZZHsldPD3vRMv_v12UvwMPlhxOEwUxJWn9vwDo6AfJBgGiLHnrYdbI8Qaf
 HVkoD9KExeAn2UGNdr.leo2UzJIBk3.S2lpfYuIOWMwXYbAM0U5s4Rpx6v7m8x.HCdIWANPrNKeC
 52fzrVx4snWw6UbQyilJKuFz_aJnxhLz8njRtAkjWCyOSjRW9VcmYqvdHz3nBWB4vqEUrzdKMrjK
 ivJbf44KVgQkHjtYJAeEh4p_x8eU10.xix9Ub8Gliz0RQeBy8crroTYnuUnD.WZkC8LS_l25bSr8
 IXs0v5fiMvMlEPbpeLJuFbAMMgUMxbrTXSgzMwwR0a0sJ2izzsyfbkR8P0QRQGjMputu_6h1wsEV
 rwBQI73Oqyve6wthAXsmtQi9iQRO5mq2ZVJ5F0fhmoMzHWb4_j.IJ9LcqiScla7DpOAM0KxaCuNR
 WOaiPIQyuhR.pubLHtCLsawe9gdVgsfxnK7IfqBNePnNH.iU38RKMD.kC38NtkicngF9b6B3Bnm9
 PdjHFMYoqRThh2hmK.1U9fqLp3wDKO9YBWsjdqP43GPiV8IO2vtC6BwsiieYP.BiOi1Xb84qe_Ca
 z639CGLApCWuxMJUI8G0eq6gdDiD4rDXDBr5YhYOsN8UYHAR1OtTg6QVo6shPGsXPu2embQuSKyF
 81XbXR6FZK9FyddWdqPTOAq5uJrkbgvml5bxzi9pU9R.ZhjlM1h6N0NMKqqqf6k3DATcXwMuvs6Z
 KjtNcqhW4Ey4XW66bPEJJj2y.67NRQnyaG9TJYWWVO491HM7I9tiEEUllnbv.DMhSsP7PfncaqCH
 69vN8FGtR5f2E0.BUE5JGTdlTpSmI5r5_OzIuuLwMtHXLnpRSpI3eaMdaAJ1uNu1SIPjzGD0pxRv
 SZBO4Ictzy_QGiocYrNshAYFQsCGWk0ajhYsiFUioLXCtQfWoAdedVSyxhgEYoRsRy_QuTze89ws
 LRaUyG9yTJM3BJq3PeWaI.ty2OvMk6WE3bc1rRDqpaGECcAYrL7Cd2B9jJpatm82kIifD6sRJiLm
 OVY.Tko56s.X5XimSAOgI5Q--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 83db8519-ed14-446d-8634-af4fb82c840b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:39:18 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 95c3151d01371ab1269f6f8bbf003118;
          Tue, 10 Mar 2026 21:39:18 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:39:14 +0100
Subject: [PATCH v3 03/28] media: staging: atomisp: Remove unnecessary
 return statement in bufq.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-3-3fdddab41271@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 5AD2625866F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-55241-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid,checkpatch.pl:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Remove redundant 'return;' statement at the end of void function
map_buffer_type_to_queue_id(). Void functions do not need an explicit
return statement at the end.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
index 0f0d16f4ce7c..51f7c9d6f378 100644
--- a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
+++ b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
@@ -176,7 +176,6 @@ static void map_buffer_type_to_queue_id(
 	}
 
 	assert(i != SH_CSS_MAX_NUM_QUEUES);
-	return;
 }
 
 static void unmap_buffer_type_to_queue_id(

-- 
2.53.0


