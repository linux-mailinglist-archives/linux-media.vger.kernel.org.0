Return-Path: <linux-media+bounces-63243-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMggGjp9HWrEbAkAu9opvQ
	(envelope-from <linux-media+bounces-63243-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 14:38:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D57ED61F604
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 14:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 189B83066648
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 12:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB553793C5;
	Mon,  1 Jun 2026 12:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="FrmGa0Ia"
X-Original-To: linux-media@vger.kernel.org
Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012012.outbound.protection.outlook.com [52.103.72.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03D835FF5B;
	Mon,  1 Jun 2026 12:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780317226; cv=fail; b=gn2LGTOu/9r6RodYMdEkVqCHi5t/FVwwQMntve4AO1IoynKAZ4JXWKxsiVIc0pUPQe5FfFETxtRvOVsaY6NeACJDaG0St1pH4GTMouyvHrCDR/p+kq7TYNEGeGCjjnqpfdtTYj+MJMC5YSJ/GV2gGEg5VkDRM3GmyOcYv/uQmnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780317226; c=relaxed/simple;
	bh=P8CBGXJh4eQoXgCCKj/JKMrR47OiY9z6al6rITHl5ss=;
	h=From:Date:Subject:Content-Type:Message-ID:To:Cc:MIME-Version; b=doSxyeDyXAeNX5sJvGRiK8Lx+m2qmukag3qyfW+RkW50lR+jh2tj0ZvzH1GOuQEfjewbk5tz1R/FaU73q7xGpcMu4Xrk+T3qEiQ8rDdMGY+r9lziA+5xTFIZawe2ts1cAXw2neqHc0axFOJOhaLQg2ljYcm5bnIlSzfv+sTTNNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=FrmGa0Ia; arc=fail smtp.client-ip=52.103.72.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gy/RcVR26OolG+3+ToB0ZUoEC9aoHjRWVrVyTrB0MRmpXRb+H6WHvDbyMdwf02IHbXNJAkoo+aUsQzrKYVl054H+L8sGmXrStmg+2Pg5e145AduYSud4JPpUDU+NFtBeM7Z7kfkawwt6T38y1/Jpk51R8+RTnM0NE2Yyxw5AUMTM8+YUPcvKYoczv80mZDsT5qkblpAjbUMe+Q48qTaIDgd7OxESZ+vcOFZUji5iqKZ/0YYoPhIEY9Zkubc0aVbdy6FrOz8KZHUbFb+9q/RuG8fH1n3TC6zmzrT2fJyJXMNS5jZsNEHf2ezF6QmwPUfcyefZJoRKpHs4pGLNgHrmAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sk3bUb3Y2XkS3LvYZw9ZH4aiWxDT35xKsqXIHS41Cu0=;
 b=tG17VN7/WpJDGeuFqLcvnL9SDVfkL2fxpfEOsyi3HPdf0xaC+X9OeJL+MBY8mmNbSkzpJtHnrIamZRNw1+CrkQqNRcGGCT+rlMH/eYtDEg/Rt8QAuMz2wcvnK+XEa26rB77TR+UdyAzRxr7y4hfD31KapjVSGEnuw6OHg1Qh/gHpDHWGhKCP/Q39hCzxKj03/73MvPLjXsCIlwbEB6ZN+5YglWmqQNE6OE0c1CpWuYKuxHkfY9TyC8FN8H5qxedAJA+ubJR3GsaCP/4l54ICpulImK7KrebCI/fCn/6Oivizlftn22aVqHIHmd6KrWKgsEAW+KnFSmXBD+URh5aPVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sk3bUb3Y2XkS3LvYZw9ZH4aiWxDT35xKsqXIHS41Cu0=;
 b=FrmGa0Ia8+10bw7oksuOqnS+7iAvrahpTiHHx6T6qWUb7UwnlhprHeHs/XfFTEs2ZD+ZknudM3lopjrONFDxCHojWCXtiapSSIPuqFzmhngHKIr6JhTrOrlseKMQhUuske+m7fpwSMo6lR12so3TqyfgRvMR+tyKQ99/oQXsQyN7fHf2IXHvgQvZWXeaEuQDfz0qwMcUn2EnPvNU0K/e/8x3DDKgtgvGGeBYVgsAindSHflhrePqtQJo1XII0JovPxoKbe9HPUkgvJxa6HufCbUb9udeGU1Y2m70I55/F45wFzKHhiEC1P1Zb4INYXRxd3pOxjeWEaxP2c5YukyGWg==
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com (2603:10c6:10:1b0::5)
 by MEYPR01MB6328.ausprd01.prod.outlook.com (2603:10c6:220:106::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 12:33:39 +0000
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c]) by SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c%3]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 12:33:39 +0000
From: Junrui Luo <moonafterrain@outlook.com>
Date: Mon, 01 Jun 2026 20:30:58 +0800
Subject: [PATCH] media: vicodec: fix out-of-bounds write on capture buffer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID:
 <SYBPR01MB7881A4E2AC434488ABFA775CAF152@SYBPR01MB7881.ausprd01.prod.outlook.com>
X-B4-Tracking: v=1; b=H4sIAIF7HWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwND3bTMitRiXRNTo+RUS4sUc7MUCyWg2oKiVLAEUGl0bG0tACnyDFp
 XAAAA
X-Change-ID: 20260601-fixes-452ce98d76d8
To: Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna3@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org, 
 Junrui Luo <moonafterrain@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2052;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=P8CBGXJh4eQoXgCCKj/JKMrR47OiY9z6al6rITHl5ss=;
 b=owJ4nJvAy8zAJVb4wiKgu++DA+NptSSGLNnqxqKnq5cI7vv+8ydzwfJ8F5NPH4oWLankTTDgy
 ZiX/c+sOrejlIVBjItBVkyR5XjBpW8Wvlt0t/hsSYaZw8oEMoSBi1MAJvL5BcP/mo8h8/bnPLVV
 85nKLVJX+a9U7enVzT/2iyxZz+nrMN99J8P/gKtzfnHe+bet5nnuTUan9VOe/l3ydFPRl41Z+Rl
 pGwUDuAC/gFDV
X-Developer-Key: i=moonafterrain@outlook.com; a=openpgp;
 fpr=C770D2F6384DB42DB44CB46371E838508B8EF040
X-ClientProxiedBy: TP0P295CA0022.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::18) To SYBPR01MB7881.ausprd01.prod.outlook.com
 (2603:10c6:10:1b0::5)
X-Microsoft-Original-Message-ID:
 <20260601-fixes-v1-1-288c3958249b@outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYBPR01MB7881:EE_|MEYPR01MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bbd5634-b1b9-4d3a-28d5-08debfda0229
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|6090799003|15080799012|23021999003|5062599005|55001999006|41001999006|24021099003|24121999003|22091999003|8060799015|19110799012|3412199025|440099028|52005399003|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2E4T1FUWERjSjh2dWNwY3J6aWt4VjhMRWdMSlZ0c1RzQXhGaWs2L3ZtTU10?=
 =?utf-8?B?RWg5RWVLakhuUWlib09iREV3UGJET21JbVZCdTVQbFBROGE2SFdaL1pwVzdw?=
 =?utf-8?B?cjVoQzVUR2pKZm4vdzZ3VU9Qa2lqeTRGd2w1emwrdTFhV2lNK2dDd3M4NFp5?=
 =?utf-8?B?Ny9hMVRQT3RzU3lVOW1vTWlpUXdYTmZnR1g4TlpCNm5jNGVWbTlRZ3N6Wjhr?=
 =?utf-8?B?Q29vSTdxa01zSkNvVUVyV0QwUmk0eUowaENoTVlONENwWnFOY2dqNUV1cFhK?=
 =?utf-8?B?cVgvMDBjMkt4U0xlSElINzdzYmUxamg5RURDMytxTnZ6Um1HNGQ4NEI4VEpH?=
 =?utf-8?B?R09sUURlK01CZlFZZTRzcWkremlyUU1oSURDS21MWjM0aVUvY2t4VTlHQy9r?=
 =?utf-8?B?WGt2TjE3V0wyR1FMZUppZzdBY1N4S0JUbXlMWGhLZjVnMnd3bFczTzEzbXk3?=
 =?utf-8?B?SGJ0Q0xha2MwbkNhemk0UGxHcXd3TXB4eEduRGpHbFc1Ymk3dGhYNngvL3I3?=
 =?utf-8?B?RzZ0VVpYWE42UUJHMGJHdEVLTFhxYmI4a1c1cFRZdTB5QTlUOVY3SjhuK2Vw?=
 =?utf-8?B?ZTRLbUZQVTlranlOVUtDdHZiMmg5eHpwaE5XRitQOSszeHNLV2RDUStPeHk0?=
 =?utf-8?B?bHYxQ1JwS094Y2QxZURlRlg4VUFOUzBEcGU1dm9HYmdpcmZLR3Y4bndKdWZW?=
 =?utf-8?B?QllydzBSY3Jvd0xtQ3JTbUpoWjRvNUxua1NWVkxjVWhTVUNOVDN5RzNJQ2ZW?=
 =?utf-8?B?UWd4eURBWWtLaWVuV0IvZUJZUXJweGZYWC9DV0E3TWVzZ0QzblpJNXBnZkIr?=
 =?utf-8?B?Zld4OTRWeGoraUxJQkZ2bThjYnhFT1cxaGZrYjgzMStkcW84bXozVHhpbmhE?=
 =?utf-8?B?MVhBanFGZXZteWx5aDlNc3phZnlJVDVpTHFIR1lzOTFaTHkrSzByWE9WTWpm?=
 =?utf-8?B?bjRyRFAzS0JlekE5V3llNmduODYzRUYzS3Z0MzdQSjBlWmc0NHR1cTJYSDFX?=
 =?utf-8?B?c3M1aXR6MW1wbCtXS3ZzRVJQM25WdG16ZC80aCtRMmsxSmFjOXViaHZpc3g1?=
 =?utf-8?B?MEhJS21RTzJxTEpkUFVicnYyYUV0YklRZU9DbStCcTRiMnA3QXFCZk1pcXRX?=
 =?utf-8?B?WndxVmU2bjlxMEt6dkg3bkgxeHpwT1VLNzcwK0Y1cXdwMGlOL1o2K0JlcDRR?=
 =?utf-8?B?TVhyVy9SQUVXSHQ0K1gyRmJxSzRaY0tzaGYrUnpvRmxKQWxDTjlqbVI5VG1h?=
 =?utf-8?B?UFB5SjUvZXo5cnJkSk5DVEthd09yZTA4QWtYZDdKRTZubjhFMk04bkw3dlRq?=
 =?utf-8?B?a1lXM2NMYjJyYnJEUnkvSzl6SW9EMGpsbXNNcVlTTkF4OVpKSkFpd29GR0FY?=
 =?utf-8?B?SGwrUVlqUkErWFNBYWcvdWZ1RXpIeGtYT01odWZvYnRDQjNsenp4VWg5NkYv?=
 =?utf-8?B?ZFFvclRwdlhIODVYY3F0Zi9taUZ0RGFsZ1Jia3VlTlI4TEZyaXFpSm1jRnQr?=
 =?utf-8?B?OEFCdGRLUHhOc0ZJblRUWStnODJnWVlMbUlKSVVJdE5vZ0p3d3VhMmQ2OEEr?=
 =?utf-8?B?SUpQZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnNIbFZxZEZ4YnVQTm1wL2J2a2lEMTZybHNFY2M4U3pRSjRlOEJSMUlQTzlm?=
 =?utf-8?B?amNUT2kxVHlGTmRmOVdiS1g5YXBXMDFFNUp3QUk0d1NBT1hPWXcvcHNWN1Nj?=
 =?utf-8?B?aXhFZDF1b0ZsTTNuNm0xNmVQVExnQVlSNG5neWJWNjNTUjVyUmRLd1VLQUtK?=
 =?utf-8?B?c2hEY3ZPL3h1dTRRVk8zVUZmWEMyT0hBRjBwNXN1OGlBUVc0YmlCYmk5T1lv?=
 =?utf-8?B?cDhNNjR1b2dPM3FzMnZtWWRXSFFTdWNIZy85dW8rOTFlYTJ1L1IzL0paMTZZ?=
 =?utf-8?B?aHBIS0Y2cEUveGloTDI1TTVIZXd0a1IydHBNVWNXNUI3UFRRRXlQOCtzbVpz?=
 =?utf-8?B?YTZ6eCszMktwQ1B6TzdGOGJyNlZpMUJkcTd4bjNkNHBHeUFhZXoyTmxNdk5z?=
 =?utf-8?B?L0VCNXdBR01rcWYzMHYyMWk1RW9iay9QUGYwaGlrWWU5bGtrRWdEL2RZUEFq?=
 =?utf-8?B?cWduM3NzZzBhanR5Q3ErV3hQZXloczhCQjllSEFNNzRxVGtYSGxiVURxU1Zl?=
 =?utf-8?B?WXBVMmo5TlpGYk1KN1UxVTJJTEV2Zk1Wemp0SnZ3ZG5WbTFrOWdXKyt1L08r?=
 =?utf-8?B?ZGo2cElUanlyeDRhL0RpeHNiaUt4VlhSbjU4T29qbHFsRkdLa3dHNUx1djFX?=
 =?utf-8?B?b1k0aFFvODE2VEYzQTE1OXBCelBqSnFrQ01lTm83WEdadHNKTDZCaGlrZDZw?=
 =?utf-8?B?VE9FRmZhMlFZaXoyZS9yQ3Bmbm9OSkhHM2ZuTXY2Y1FxakV6eUZQaGdCaHVY?=
 =?utf-8?B?WjBqNHhBaHlTMERSSmZnM0lHMnE3UHlMY1U2c0V2djZsOStYbnl0MHBiTVpE?=
 =?utf-8?B?enZoK0NSMVIwOGk0UVVicEdtNU9oMlFNSDE1Qm1ucHU2eFBaQ2FJSS9PMTJn?=
 =?utf-8?B?dHdJUmhKV0laS0YyRzUvTE1iK3RsOWVpREp3MElQYmV5bk5VcmtZOThEOUVh?=
 =?utf-8?B?MXNSenRIZDZtQnRlRERsaVpLQ3lseTVXVGlJcDNkRjVtUzhYb3hnWWtlU2FC?=
 =?utf-8?B?dHFWaTV5NCtNbjZxR0VEZzk3Q2hPQXYrWUZWUldaK2xZTElJeHlqZDFoUitr?=
 =?utf-8?B?cWpSQk9QZFRqRkkzdkZORHNqa2lDWGVXeDNpc2pjWW0wMktSZlJYVnl4NjFH?=
 =?utf-8?B?SEdZLzAvVDBYVnJNMFRRbHgvcmhWUzF5Q1NqTGZidGtKNlpHUlczNXRmVmxu?=
 =?utf-8?B?SStSWlVKdjNEd21zU1RyMzgyd2J2c0IzazRiMFFXWXZwcUU2b0lWUm9vU3h2?=
 =?utf-8?B?VEo3NEViSWs4NXBlTDF6QW5oM3VQdWFRQlpSVHB2WTlMUEdPZmJ2WUJwMnNh?=
 =?utf-8?B?eHJoNzhPbTljNlZCR21WQkNDYVN5Tnk2VFBkOVFucDVrZFE0M2R6N1MzdEFl?=
 =?utf-8?B?aUcwZVQxVmsxN3pDQjJaYU56SGFYMEFSdUNoTkY2aDJVMGJYRG9sWmEwcC92?=
 =?utf-8?B?dUxVbVh0bTRhbXZiaXF0em1GejBFSytERUl1U0d2SHUvRVJQQXRUcUM5aWlp?=
 =?utf-8?B?SUZpZ1hmRXZsRmQ3YjllWW5qdU1RblJXbFNYRkdoeFd3VWpRellUd3BQODRk?=
 =?utf-8?B?enU4U2JMVkJBdndFTTZ0TWFVRE5HQnQydFp0c0J4cjFMbXIwNWlOaHF3WUg5?=
 =?utf-8?B?c2tKU29kN0FXTU9QejdqRjRzVVJUYSs0MlREaXQxZ3hwanBWL0NrOU4xWm92?=
 =?utf-8?B?TjA4dXpES1IzUHZOMUhNbGNSZVliaG1RVk9uS1k1ZmIzZ2Z6MXNJeFJsOXhG?=
 =?utf-8?B?V1JJbFBqVktEZTR3ZU9sRzg5SVhHOW9ZS29RSVhvSDh0ZDYzamx2RHZLL0lh?=
 =?utf-8?B?Y3dVQVdVN2RTcU13d253NERzZG1TanVEYlRWb1NidGo4cVRFa1dWUVBNbGE0?=
 =?utf-8?B?a1QzTUhiMUxmV3hNTmwxay9UWGgvM3MzanNQeTFmazc0T2c9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bbd5634-b1b9-4d3a-28d5-08debfda0229
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB7881.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 12:33:39.6613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYPR01MB6328
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63243-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,outlook.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[moonafterrain@outlook.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[outlook.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,outlook.com:email,outlook.com:dkim,SYBPR01MB7881.ausprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: D57ED61F604
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The vicodec stateful decoder handles its first resolution change in
vicodec_buf_queue(), which calls update_capture_data_from_header() to
set q_dst->sizeimage to the new, possibly larger, format. Unlike a
subsequent change in job_ready(), it does not set ctx->source_changed,
so the m2m scheduler still runs a job. buf_prepare() validates queued
CAPTURE buffers against q_dst->vb2_sizeimage.

A CAPTURE buffer allocated before the source change still passes
buf_prepare(), and device_process() then decodes q_dst->sizeimage bytes
into it with no clamp to the buffer's actual size, leading to a
controlled-content out-of-bounds write past the vmalloc-backed capture
buffer.

Guard the write at the decode site in device_process() against
q_dst->sizeimage, the number of bytes the decode actually writes. The
destination buffer is completed with VB2_BUF_STATE_ERROR by the existing
device_run() error path.

Fixes: 3b15f68e19c2 ("media: vicodec: Add support for resolution change event.")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
---
 drivers/media/test-drivers/vicodec/vicodec-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 318e8330f16a..2950d42c8c63 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -321,6 +321,8 @@ static int device_process(struct vicodec_ctx *ctx,
 		q_dst = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 		if (comp_frame_size > ctx->comp_max_size)
 			return -EINVAL;
+		if (vb2_plane_size(&dst_vb->vb2_buf, 0) < q_dst->sizeimage)
+			return -EINVAL;
 		state->info = q_dst->info;
 		ret = v4l2_fwht_decode(state, p_src, p_dst);
 		if (ret < 0)

---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260601-fixes-452ce98d76d8

Best regards,
-- 
Junrui Luo <moonafterrain@outlook.com>


