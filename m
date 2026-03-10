Return-Path: <linux-media+bounces-55252-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCqaMdGSsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55252-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:53:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7D5258890
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFBAF32580B2
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8AF3F166A;
	Tue, 10 Mar 2026 21:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="o/4B+SIj"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic304-23.consmr.mail.ir2.yahoo.com (sonic304-23.consmr.mail.ir2.yahoo.com [77.238.179.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFA8245005
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.179.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179369; cv=none; b=HS/hKDVA8MDoByARXxjXvjofpozj/PAwHFZdODwxs7DGpoGmWSFiI7FWmFfTaVzwiNxetEGtzVQ4qOecANIHQJZv0jSMgk/9/dmKBI/hVVXs/EaKgdVBe41/DM98+mHqMdKxSIVXs0QEBhqddZs2mgLSoCFg58hkAnk+g+Q17Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179369; c=relaxed/simple;
	bh=JBcQNqXbiFhPwJCtic7fUUTLp7DIa5Ua5LjNKFKobKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DoCYl5n3jCbkkdZq5QBcEJZZLwbHP1lhLLhPWanfTS5I53cvkkJucL9PU4iQ/OQM1FxxFYZ4Joxq60GdrqF7NblVQxcMdqhW6zaZ9OfjEBFDzNww8yGnQVKHgOW/LWcaUZ9D3DMsGQF0Iud1rNRFZOFuVUsD1z1cOBqZLodAvio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=o/4B+SIj; arc=none smtp.client-ip=77.238.179.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179366; bh=aearU3IfMr8JowATbRtdU71meIMxzkiL51qBeIbhKxw=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=o/4B+SIj5JsWO9MmR007vMK4IXHXgOhK0LYS/Ff7ojL4LFpdHS8bniRZgiQ8Jw7MS0qPFvcDZlE+vpWs2FxS8q2Wol8Shr0pH/pK3gOy3V5T7BNmgnKG1qFKttV/+ZwuTVMWMTn9yaHD0sAdKOjgq+JJhehTGszrMNmY4En8fQOwKYRMZRxAqMYdzplLMOlaWw488AKoQh4bB1dsp7oC0mP3etP3MtjWR8G7e9ZnjQxRiUwUyBsgiX5x3N3NpxK0n3K6jthDdn5MKDH8mkaAbRDi/Zg0d0Rf2FB15Clb0lJRucJ+FxSj81OZYdIih28B3HvUNe+AmqBCfwuoeYUkag==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179366; bh=DQng410+zshtew4/P8XW7OqxQdqtPW8oIuNj+3v8qMY=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=PKZJFfM1kAbjW0JzJ/EnsD86uKDj1ryxHiq5ajOElmdmVbhv6R/27GbY7ueATLj8KxthRuX+Li7Tcu9AMt0fCjKYcryeBcGnoBn/WkOu0dRw9k4fQApbxlZBxU1NoplbSZYQe1qgHdsYgD7PylfWlUhllbMFVlQL+66qVfLq5280eusCdPL/aV3zCHiBUce7rNzA2E4dcCgwH4ixL+BaGKszJthCvjCVGI0JSvG7oUkkoiU+sYwd+34vp52Rn5CWPHD4eKtfDq3WicOJGZWdmH72OPRta7ACWK6HfGaKfYzF/duxHtGAAjUIiSNmGNydDxmRj9AuOeDUwTGQxbQfsw==
X-YMail-OSG: EHNXloMVM1lnoOqQJ7G9Nn0QcdML7Vjsay0dvEojWfkw38XrZVFVK2JFHPYE2Z4
 loaFdNZBbGOwh0Z6R4DDWFoev9kQ.WojkyXSwgPIQOI69ONIBqy6h7GuVUMKZIAnwYijXokEFqtk
 ByiQid5JmNpl29S9ft201Rm6WsSpanK1savmWkJArIjyf0Wt1ffWtfU21Bw9JjwO3fpfiJgjt3L1
 EZOsG7MVLnSvjQt8y8FxPSn7Rfl3HmsL28VZRNo17fu44mcDfUtvpFsnKm9nXW5cT_qCu8lqBegu
 pN_WlpfvLav9PjEP70grfFGPQoOAMURrsPZlNbk_eKY_GjDMHLP1RZoyGFMWApNfXVM4MZFYl2ij
 Ng4.tNnV6TNwgZcD8rWQcRYsPNCn8VORgPld3IFYYWdXcfym5eQLQLbPFmOSQYaGZnPcBnWwXkBT
 IqwGHPVJaRwCqdv5Pink0Ww7.zAmRYxRFTZLGiysR5pFj7chf0yNgGj9gwmvTqT3IxUlz1FRYV64
 SUFvNtUWsiPgdwEf_buN4IhnrJ8O4PYP5iZRJfOclJ687CgFS6YTk_7FG02gFgn3qFAkmo9TjcAj
 zisv_4AgPP9EbgyKZ8IvR71lReghG5e8GJscp5ra4fkPSS7W6Z_xHa1xNuZFEpGBkwMlJs62kEm8
 M1wuXMVIJR1biEw03KhwmUd_agKt3NXxLVd8_trt_eFZzIQwHfYIdIW_1hl7OHNr67tsHFwyMNvX
 bxSmlqgyMC6GkLLVWR5DYtP5qT46OSv_2dyZhmhoso4tp48ygJMZfoVO2Te2k1i2T7E7Hmm6z702
 jUT44vfHi4EZHeF.zUbIScD4qPhoVDgQRqHkOkqyXPsn1zNY28c3sn7kcPFvajZgzpC1S8qJkZ1t
 GRN7lJLt4j3PsLspTY6dzx4Q8z5uSNZeIcuPLCtj3G8JPDxEwSewI4l.AHuNrW9jMsWjAhxWI54l
 2agzxvaIWeQRHPstJIUJKI1HUor6JUD.QhmsHn9AZrcAosn.6.6CRkN71I6Pxx07l0ZQ8QwlZNkU
 KfOKaW9ckx2uF6i94kOo6cqBpymHYpI1TmORfCNbYfEM1_PmQck1FYsc8NDJSBzQp2HXhHt0ZjBj
 BHOd4RW5gcKlUqbEU7pmLss5NxP8vkknF6w39K80w3vJqT9iv89cko7sG069LEwFmQLijsNJxtRU
 p9T2bYyl7cNepl3i63xCNKhK5QfGFBWeSjQ9n2P9jDWcXODxoZA89KR3Le.DqyN3V5Qw6OaFuSjO
 vGI00SzlRJp6ivcS2uYK96u1kS8z16h4v4pRBcBi3Js6YZ_5D.k9ptDei_aFoJvYl_iHDG0H05aj
 i7zUnq9ar3JsTRiMykgfrb3FbRtfTeX7dAlDH0MVSNnrSOdDuPJF6zUuGFyq7tcMLmHbO9oJ.bMN
 MqanYeiOrHF.CC_Q9U8BAMzSBN6URBmEteUpf79Kot6hLnqwhPgxlTaYgdqLxrVv_2C.tZ3QN2I4
 4oV.wPi7BzBsDujfqRZ8V7w6COoxQb7iYWItYHaoDVbP1We4GeKKqZcMsyex1NfuB.sCcxEuzsEi
 DRjBoNOnuf7E7_bDLa9JjRRP7o78CsEj6n2rotaSw3VjHb0z1E2Ni_guO2n_v1ONrKw1Navbuee_
 MXu0C4UJWmIhbi_PFrCdCZaqWQ0Uremf_Bnmm.b73KCn0ciLdIAM_XccsgrKbNdkUe4WDfp7qfeC
 tVDbAwArvPruOQbyRqQ841KaB27PJv63auGA4ArB2Z_PkwoRYYyNX2MRUlsfROQ85p0AhM_NaHB7
 LOHfMB8DN6weyb4GyQ8zSDcLKmZ6lUzwtZ9zCBpu1vAxIKY6WtAhSWQjrIvW7uy6g9syzsTwROla
 X03TkBxreY4MauPgk4mT2LZklYAI_Ng1vY9KJVmwa9rCbZlDHqUlfKScWw0j3L5l7gIsLTe7UApX
 6g_q_PYj5ZenFzm1WZlC_cIcJxkrpE46IwRKZaho7idhR6lD2740qC6NLJ3UKLjkMCJmB6cmzm5B
 7Z8gzKVXtOUSE6IaQwpUZlRY6hoZU729CuTkquSVIKxDqq3HPmnpBTGoGWtDp7ZqkfW_9pvC3nu8
 Dz.9tFXVYvHLQnm0UUrUs7aMZjD7WwyhOHF7IAEn3VYPz4BnWCs8tHUzmRaUckDLQ_8.5Y47uHun
 nXQsn3HicfJEuGuLB62ChsdJWH0Q2Q0g_Leg7vR2jtxuEmd88_0KjU_w91262KYbbY5wDCTziJgg
 ONChXtochbtsDCTh27AEhbagGnWbsaPAg1ftUybamkyGM080SeAVdz207mRrFz_Jb7Gy6XSmLYJP
 5mdBpPqhR9Rqzxp2wjg--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 65d8f26d-32ed-46d0-886a-8168c3c9ff76
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:49:26 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 95c3151d01371ab1269f6f8bbf003118;
          Tue, 10 Mar 2026 21:39:16 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:39:12 +0100
Subject: [PATCH v3 01/28] media: staging: atomisp: Remove unnecessary
 return statement in void function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-1-3fdddab41271@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 2D7D5258890
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-55252-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,checkpatch.pl:url]
X-Rspamd-Action: no action

Remove redundant 'return;' at the end of void function
ia_css_dvs_statistics_get(). There are other similar occurrences
in the driver that will be addressed in follow-up patches.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/sh_css_param_dvs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
index 9ccdb66de2df..3d2cb2d25fdb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
@@ -269,5 +269,4 @@ ia_css_dvs_statistics_get(enum dvs_statistics_type type,
 		ia_css_get_dvs2_statistics(host_stats->p_dvs2_statistics_host,
 					   isp_stats->p_dvs_statistics_isp);
 	}
-	return;
 }

-- 
2.53.0


