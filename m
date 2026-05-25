Return-Path: <linux-media+bounces-62731-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGcsLh2bFGo0OwcAu9opvQ
	(envelope-from <linux-media+bounces-62731-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 20:55:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 183DA5CDD83
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 20:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1A1E301A1EF
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 18:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E66383C7B;
	Mon, 25 May 2026 18:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yzyHOPby"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011008.outbound.protection.outlook.com [40.93.194.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158902DAFBB;
	Mon, 25 May 2026 18:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779735308; cv=fail; b=LBDPVDRYbv7R72f4BaXh0M3r6+m81I22jbXpeUc4i5GB9Ql3/vZZnG7q7lQeLh6U0WsJo5A6Dhn6RJetBBxD4a8xChYJRaFW5RvVtQz3gnHYKL6mNyzfX1EIu/a4YoGd+e3tkAsMgBubz4mZzX9CrxSv/h5A1QJbmcPET3bRC6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779735308; c=relaxed/simple;
	bh=8lD02yrwqw5zGcrXIvr1Oe+5JffrT3GCCZ094Gj8vYY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V318I0qHTg0WHtDWu1uozVlmcgsn4LV0M5hhP0AVfeCDP5yz6p/+KnyP25GjDK2j/mmSG0JkOMByrGw52nTEHtFYolzaepdnOuUz8hp/PD5rZoiN5ZxRMpWBvAKpYKSzrpVI3ITdvm+G5O3jMUOSg+X+0huRzbWLfKlFIgdq3ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yzyHOPby; arc=fail smtp.client-ip=40.93.194.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POBApI3OJ9wGx/ItI/I689BALHHkO8B+Z7EjT0BeKNyCfg5xuCAARePbSKgWWL62dckHJuXHufwR1o+p4X90o0OTGml6ksnMt/l6w3rq84k3sD1u8ZJx1pwDo1BPK1tsE9h1je4OJFr/xzv5qxp81CHwCEdQHXOLJngeReqQIyzW7WZSZ4KwWdgAzjdW3GM7ZzVBUzSy4dueBnz6Bni12tWdrs1s09jSRsvvcGo+Kw9BP+X24eX2xgdW6VXkTX91q9d65ay79xGiZ/Ceg76Yk5VZOMKDE+IYQzz22V3oJe6eufWBOtMWByUzwtaRa1KQgKeHUppO86zfqsiCRISgig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9hZCrlrXqhHs8WlMeU6jvwNDDJNIX5yhs/sQ7sjSPM=;
 b=BoZFE6ngmOEgFAlb5TcT4ZAAKlkRYEN3wHI7FDiVOrpPP5L+lbFSoRTw0rW4Ml0oUMZQuZgw9tzWpJAuDRqZKf0X1sfhSi9b/xD1mVwMEmS6G0vxxr+CCxDCYaoQf1GPw9WEF7Hd+ge60BaDqYV9qefamnVLHQm21L0jF18aVjdGGfQVYg1G/RoVvF4CnyUvz/XCwfg9mCn4RtHmzVmGalIpCvGPjc98LcDVPiazbOZT/59nhJHkIS++Rw783TvtceUIG/7f/m8iPl8cf0KdbG0HDj8vC9cdooXFMHWfZ4z5Z/TUMVLT0/DH/wbaC35WOyMkXSdPO6FM4TE2gSB0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9hZCrlrXqhHs8WlMeU6jvwNDDJNIX5yhs/sQ7sjSPM=;
 b=yzyHOPbyWAX9w+yr/4SgP/zgKcxvO59fdLcQwqvalHU6s5bx62i12qUU0O95phv48D0e6xy7tQpE+MiXWyhSpG8hgEorOfAdTn8Ro1nVpT08GR0pDJY9YBckFwwoWMwX/FAunBV+D9jVgAGLfXXT9i8BG9TkWennmSQyFdKkC00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8740.namprd12.prod.outlook.com (2603:10b6:a03:53f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 18:55:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 18:54:59 +0000
Message-ID: <ae16f5c2-c6d9-4274-9a27-f87bfe931b1f@amd.com>
Date: Mon, 25 May 2026 20:54:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix UAF in dma_buf_fd() tracepoint
To: David Carlier <devnexen@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: gaoxiang17@xiaomi.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org,
 syzbot+7f4987d0afb97dd090cb@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20260523181446.69525-1-devnexen@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260523181446.69525-1-devnexen@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a10d7d2-d65c-4bdc-917a-08deba8f1eef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	lu+rO9mrlAPlCymjKLNmrMl0aqWcB/2J7fgbzF7cx31SSq/DCSpqnD1hHuXQ5lwuu+Z0E8QaIBRmBDE57XI/snCaMaU+VYVyjVPtjHO66hrl7GEcrIFtNXrvKji6ORTmfVqg1H/m14zpOdK9PDuQe4XPGDLI7eZ0Ln2zQ0SeHwYmW93niUdfTNJn1ex5/PB+bnXZPVc1NNo5q0ptcN45awMIwm1XuZKv6vDl2cPT8DuwqQhyQfShjdH2rt9zJRrvQbCz4mGXRdjP3TjPOV1fcM+J5897pYxH2nbpIv0UCOAdgt2iZIh9bR+nPwdPIvyV3cF8ysmJ0ZMoFzdrIwxMQhDqNS2d+p4BJpwrkZOzhrwniM0BEhalwDBtp3cJ567i+3h6yQrvh/KtCt+48XaYy+N05+oV/NHjgnZ/c9XfEc1ukabA17URApmesmpEvMIqd6vngI5MXrE+XtXYwKIfQFaaDIwkA/6F8kqCjDJdgzfSSzISNq5CloMM5xKDuft0odOV6bV8QGz7u4roPMwsTeChPyg8FVhcSkln60otmvabSRY19niISbzCbpbWkbn1OLpJtFUWSir340aHo9EZJIvzy7fBynZkMCAhEjf0QE70F3mKNRDTxW2T8Vqkqg57qi1sW94FBFHDY+DgZSaZKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXM1aHRWcGx4Qm11VlNvZ3N6WSthQnUvQVZPZ0NyTmJvcnlkdGlXTHR5RnNz?=
 =?utf-8?B?WVlxWkdiRVNxcitSMWhvd2NQVkVSVERsOGNMNkFNNENZaTFFVDh2bGRHQUl4?=
 =?utf-8?B?Q0lMOG80VzkvenZwekk1d0llMjg0L1Z3QUhLUS9rNkVQM0hNNU55N0pKTmRo?=
 =?utf-8?B?Y3BGQ0RpTXJYMDRxN0QxNHZkTTFCL000b0MrZyszaTFzZk9HcHRpN1UwWmVh?=
 =?utf-8?B?Smw4QXNoSkd0dXQzNkdUYzFsSFpyR1A3UGNwd01UbFBEWlNUUjlYMkFyOW9Q?=
 =?utf-8?B?L2Q2TkNlZ0VpQ2QwTlEvTnJBWjBWODRvYUJGVDBPN2ZHaGZtc09LaG8xc01l?=
 =?utf-8?B?ZDhYVVhVbFg5RldhdXYyNFgxZ3VLTVFaTXBhQURReUczSWJRVkJnQlh3bU1i?=
 =?utf-8?B?c1p3ZUF1YUlSQzdTZDMrMWhKSkJydXVKcktOS1JLelhCbjFzWkxVaHhTSDB3?=
 =?utf-8?B?L2NHS1c4VndlNkgweTFUaDdlWFJNbFk3alZ5R3B3OCs3dUR2UHlvMUh3UVho?=
 =?utf-8?B?ZDdOSXVHRlBPSVYrRGtrYWtyNmhyZTF0OENhYzJwMnNlMC9MaGFwYjZXRjlv?=
 =?utf-8?B?aEtoczFrNk1lNU5WVUo0eHJPdTNhNlZsS0ZISEdIZkdDVjdkSWFZK1ZQbDdZ?=
 =?utf-8?B?aVhtbDJFSnhuRTVWeVBPa1VYamxZYjB3QnJ4Wm9Ud0Y3OGxjZDlJUFhTNmJj?=
 =?utf-8?B?RGw0Q2tnOTNJV29iOWNjZjQzaUg0dElRdjZNVmZEcGV5djgvRlZWbzczL0d5?=
 =?utf-8?B?NzBKWmdVZ3pPMVRySVN1T2JRVEwxL1h1dTdtVyt3UWVTZjFxajM4cEg4ejli?=
 =?utf-8?B?bjczVUtDbGpBeWJjYXVMYmR6VUZVNlAzbzVtRnVPOGdRSmpqZkxUUjlaZ0Zo?=
 =?utf-8?B?K3EyTmwxT2tWTGsyaVphWi93K3drWTVSV1dZM3pJYXFZOWhka3pwTGxST3pL?=
 =?utf-8?B?eGlyZkxJblVUYTB0Uk1nczRWWjhFZ3lhOEJJdXVueVFzNVBpUjQvVVM5N1dR?=
 =?utf-8?B?TGVWU1hndTlwcnhHdEUyVngxZGU5Rys5WStOaHQrWERGUFA2T3RNRHJVblJ2?=
 =?utf-8?B?N1hYOW10T2NETHRFQjJqOElpUFBDNjhGK3lPUTFtbTh4eURmVVB5ZSs2YThT?=
 =?utf-8?B?QWxiSFdDQ3IyeVp6VjJiZXBRV0VRMUJjSUdHalpwa1JjNXkrVS9ERGtVdzg2?=
 =?utf-8?B?VXpDTmFIKzM0MUdORThlbkxwM2dRWGdFSkcvK2NOSDNwWThiRHhEdzQweVY4?=
 =?utf-8?B?dTVHcFhzZlhWUHUyRTJKa214TlVGWjRBaGR3cGUyK3ZQd0d3cDV0aTdBL2Vz?=
 =?utf-8?B?ejhPcDljWldlcmNWdVBaSk9tQWFKejdFSGdxMDdjQkdZc3NGVVloNitJWnlC?=
 =?utf-8?B?eVg0V0NJOFJ6Y2U3MlU1SDFMY0ZrSU9lRjRLZGZIdDRaWHk1UmhJSTNpdmRq?=
 =?utf-8?B?blhLc09HenN0dTgrakFHV3FVbVgwOXdwLzdUaW5uVHV0WGU5UVErN3NnRDBr?=
 =?utf-8?B?UWJkTFJiMFVUWWp4NnJqMEczUFJqY1cwVUxET1dUNEp2MkhTamppQUc0ZjEw?=
 =?utf-8?B?MDJTaXBpZFdhRnF1WlBCc0U5ZzJ1cHlHOGxvK1lURFU0Qng1d09CVm5qWmtF?=
 =?utf-8?B?WVNsM1VoUi9wcFpORFBBZW1yc01HMUhTV3JEYkUvNWgwR2ZPK2pIcmZqbXZ6?=
 =?utf-8?B?bVB2OEU5eVk5Q2JDV1QxK1FRdUIwV1N1VENDdjMyTy9jTG9PTzJ1elUwRVl6?=
 =?utf-8?B?V3BjL2pRYi9Tb2xZR3ZHSy9WalZFM2xEZUpRREhJNWRjdElLR1d2bjI2QUp0?=
 =?utf-8?B?emFQdDNyT3BBWkMyd0ZTeVJmM0tVVE9BeEdGV3psUDRQMjh0U2lvRUFPNWNO?=
 =?utf-8?B?eUlnbml0UElaQ0VaR2NOVUQyQy9BMW1NOTZpUmxkUVJyR0lFMTYyZlR2WGRr?=
 =?utf-8?B?ei9lQ1lTRUFmMENNdTZjb0pwTDhnVGZ4TVFEazlXeXpwanpvTWsxbGN6ZjFV?=
 =?utf-8?B?M3FOY1I1YndjMlVZNEY0ZktRcVE0TUxwdjZXblFrbjR5elNBVXFrRWNIYVpB?=
 =?utf-8?B?QjN2b3dKYlZYWHZ2Sko4Qzl2VGRiOG0ra09kUVdGMjJ5bGUrV2tOMlpLNXFE?=
 =?utf-8?B?Tjd3WkZaYmdqaHRUUStSdVVEeGMwUy80NDJuOXZ1TElrbVNjSkZsNG1Uc0Iz?=
 =?utf-8?B?eEJRZWo3bVl1M2tUQ3pkazU3akVhYkN6VGhrWThzS1RmT0dPVnBRV09qMFJj?=
 =?utf-8?B?VGlIN2pPcmQvWXArSnlMbm81UXFRSS8wOHBwUFg0Wlo4a3dpMXRlVitYcFhy?=
 =?utf-8?Q?BGyj4BIlBRSJ/UjLMR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a10d7d2-d65c-4bdc-917a-08deba8f1eef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 18:54:59.7657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fh4wJ+WPAgKSXTZmGDVXvlwFKZ9dg8QAgTUeCpRNdREvXZYUIYyNJTXNujYmHe2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8740
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62731-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,7f4987d0afb97dd090cb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 183DA5CDD83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/23/26 20:14, David Carlier wrote:
> Once FD_ADD() returns, the fd is live in the file descriptor table
> and a thread sharing that table can close() it before DMA_BUF_TRACE()
> runs. The close drops the last reference, __fput() frees the dma_buf,
> and the tracepoint then dereferences dmabuf to take dmabuf->name_lock
> -- slab-use-after-free.
> 
> Split FD_ADD() back into get_unused_fd_flags() + fd_install() and
> emit the tracepoint between them. While the fdtable slot is reserved
> with a NULL file pointer, a racing close() returns -EBADF without
> entering __fput(), so the dma_buf stays alive across the trace. Same
> approach as commit 2d76319c4cbb ("dma-buf: fix UAF in dma_buf_put()
> tracepoint").
> 
> This undoes the FD_ADD() conversion done in commit 34dfce523c90
> ("dma: convert dma_buf_fd() to FD_ADD()"); FD_ADD() has no place to
> hook the tracepoint safely.
> 
> Reported-by: syzbot+7f4987d0afb97dd090cb@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=7f4987d0afb97dd090cb
> Fixes: 281a22631423 ("dma-buf: add some tracepoints to debug.")
> Cc: stable@vger.kernel.org # 7.0.x
> Signed-off-by: David Carlier <devnexen@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/dma-buf.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 71f37544a5c6..d504c636dc29 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -792,9 +792,13 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
>         if (!dmabuf || !dmabuf->file)
>                 return -EINVAL;
> 
> -       fd = FD_ADD(flags, dmabuf->file);
> +       fd = get_unused_fd_flags(flags);
> +       if (fd < 0)
> +               return fd;
> +
>         DMA_BUF_TRACE(trace_dma_buf_fd, dmabuf, fd);
> 
> +       fd_install(fd, dmabuf->file);
>         return fd;
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
> --
> 2.53.0
> 


