Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43DB627FB65
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 10:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731611AbgJAIV5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 04:21:57 -0400
Received: from mail-eopbgr750075.outbound.protection.outlook.com ([40.107.75.75]:58753
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725894AbgJAIV4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Oct 2020 04:21:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hmf44o7/7XFZmBiYTsM9FthHI2/h0EzDpwGj6rt4RblGYYU25/7yFadyuae+Hv0GjVU4oj2QNRlrB1OVJOo1oB/v0w2Pw5R0dyJd2MVDp/M92E6ibdpY9yQeDxjegVdOtqjGtgZ1QORIaZiNxGx85Yv2dK0I5nbT/X5H25TrWyLuAcOtl/7rlpixAgqz5wpxdR8buYt9UlwrkVKyurFsDa7EebcfENNtzTRluF6E0oXVXLu4H78MSrJnOmqqDTnH2OqduuBdmQaj/KwBkjAWaUTJLx3QHe7cIuVBTs3FCE1hBxorHwiTpEsZZM/Cym6Jut3DFnu/80LFFeoYgyKsLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OXQNVWsE3OGIQJmMbzo7IwXQN/TwMiJA/unJhBImi0=;
 b=XJIiQwpYbVPr76PtEsUS0sezeXn4oARhwB47Gmpg/YQzv4t+TOneVQwXiPHvsDe0mXoGuKg3OZhdOi1kh2sRvQkf5p2uuLXAU6+Xwwg11GOp9sfz+E9SWqmG1Z37tR/hc9xCDy4TnzLcwjNUV8gpnejLMDTf5N/2WmkQ9OLU+g6q1VJtf5ubdscxhfrmI4vZDBUsPdFJk53E4QUP1yFxwZCuKYqugaiY2oJFk6mDrvCq+wCVuPC90QP9zfBabn68+3c+4jnKuZTee1jAdBt+3SOdXl0KKnLIdfvF8jGgjk/Cylt5KmGtfxlLllan6FYOXWFS2DEKAFP0CI2WGjdAng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OXQNVWsE3OGIQJmMbzo7IwXQN/TwMiJA/unJhBImi0=;
 b=iqF+lv9GNR6kaoUFPY/SRvkn3ERp45Hu//e1dSbWrtc9GIHj0MZf3fiSX8K60kkIak7KZXscLdtvRQj8RQMApQA5I7d+cOrMWskP6lPTOMl1mm2QQPXm9HWolRCk1/GnsGaEAK1Y6Nfy7We9aLD7j8/Fff/CCNEbKK9H3ABPf6s=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=silabs.com;
Received: from SN6PR11MB2718.namprd11.prod.outlook.com (2603:10b6:805:63::18)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Thu, 1 Oct
 2020 08:21:54 +0000
Received: from SN6PR11MB2718.namprd11.prod.outlook.com
 ([fe80::4f5:fbe5:44a7:cb8a]) by SN6PR11MB2718.namprd11.prod.outlook.com
 ([fe80::4f5:fbe5:44a7:cb8a%5]) with mapi id 15.20.3412.029; Thu, 1 Oct 2020
 08:21:54 +0000
From:   Jerome Pouiller <Jerome.Pouiller@silabs.com>
To:     linux-media@vger.kernel.org
Cc:     linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Martin Liu <liumartin@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= 
        <jerome.pouiller@silabs.com>
Subject: [PATCH] dma-buf: fix compilation of the userspace header
Date:   Thu,  1 Oct 2020 10:21:38 +0200
Message-Id: <20201001082138.381495-1-Jerome.Pouiller@silabs.com>
X-Mailer: git-send-email 2.28.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Originating-IP: [2a01:e35:2435:66a0:d660:ad2d:93af:2700]
X-ClientProxiedBy: AM6P192CA0078.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::19) To SN6PR11MB2718.namprd11.prod.outlook.com
 (2603:10b6:805:63::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-42.home (2a01:e35:2435:66a0:d660:ad2d:93af:2700) by AM6P192CA0078.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend Transport; Thu, 1 Oct 2020 08:21:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d647eaee-eded-408b-8ff5-08d865e30dbf
X-MS-TrafficTypeDiagnostic: SA0PR11MB4574:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR11MB4574D3286DEFC0D54054DB7393300@SA0PR11MB4574.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZFtrAWvmcF+J9oo3Ph3Quwo5LkkLqy5FvwEglyUqt0Du2HShhovArGDhKu6xZuxqKwyu+sEcVfEU+LOFyCojXQ+O9UKsOvg3JgBNHZ6cew9n6vroKNHySqD7cXFNC91uzY5VoGifQ9ak9Wk97BNxXV0DIMVWaM0n9EBSuUFmWaV6oyWGxn27B57VobIgdDMOC0CT43g5cOQdn5cs7GPObeAtf6EqkywwKPWLnAI4Ptlxdn++cDqAhlhFX+orrvRNuyvSm6A30qSoP+xjxlfWD76KdUuNYhTKKUxYqGiUEquei4LtH0W32cKtV15a3xVvh3MtmQHMVLTjgAKJjaUf/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(346002)(136003)(39850400004)(396003)(8676002)(36756003)(6486002)(4326008)(6916009)(66556008)(8886007)(8936002)(478600001)(86362001)(66946007)(66476007)(52116002)(6666004)(5660300002)(6506007)(1076003)(186003)(316002)(2906002)(54906003)(16526019)(107886003)(6512007)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: eyaOS4C/8KQcNnPToR4E3yQLuuTozfPtrNTevhH3EwJqqVyw40EJ9Vopy/2jwGxoms7Y+nO8ykPXGux9JGgp75wlje9zUCwlFLCo7WgjOWkMYKxJyvKB8r/SK5BkfN+nNvMB85wXSnVx/Mrdq6yxaof26859uU0XUbRlouCC+SgR4rvZ0A5Lk6FIJ3Ig5AA8RYJt05nlj/w/RYd6oSRxZUgj2/c58P54UaiLjv2gc6NVcU2KkYOjuQwzg/2M2WAahkFxQjB1TEfc66dgI4bM5tdyKN1/glu5IynJ2DVn4O7Oow9rWXWFEKW7aqaFQaW6BCK47No0WboKgWUb3R0aoiCfCO6GL3PtbhpkXJj8yxIIcE3ont8VUoR+CacseV0uwt0x9K47HeUFSYZquJ9GJiy9qiQNF61G8M/E95XtFy2w+UpwqNZGXkJ7/Wke50B0zgPLJCGkCzUhUfTOGIqiLNXgcRp1tHgagtvDj/Z6gLGz+66No0CBhHZDV9J8nkLuzpKbTY09edX7AGVAt7+4VN2dmMg8T6ALUBabAc5Xrl7wj1+xG0evvJXTSqzzP2+hKTG/ZM7zAbjXuLwWLW6FK4kyA9lh1qmbK9MKe76KfhhLdYyZJqc53Atrieim6nA8QfJLKMN9TO5X8crgwRAXtTrDrJI77RwLjCQzkbt+PzWt7t6soUfyMoIkR72fq61aVHcR3nVNLze+tGWiHVzNzQ==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d647eaee-eded-408b-8ff5-08d865e30dbf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 08:21:53.8842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POj5u/Q2IO6W4t77GGzGOoG56vBnNoVWPOSFinrltRNnI/L7qAQWDe6xzCcE6ardQX4oCa4egcOHECEScDNxmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogSsOpcsO0bWUgUG91aWxsZXIgPGplcm9tZS5wb3VpbGxlckBzaWxhYnMuY29tPgoKVGhl
IHR5cGVkZWZzIHV7OCwxNiwzMiw2NH0gZG8gbm90IGV4aXN0IGluIHVzZXJzcGFjZS4gSG93ZXZl
ciwgdGhlCmlvY3RscyBETUFfQlVGX1NFVF9OQU1FX0EgYW5kIERNQV9CVUZfU0VUX05BTUVfQiB1
c2UgdGhlbS4gU28sCmN1cnJlbnRseSwgdGhlc2UgaW9jdGwgY2Fubm90IGJlIGRpcmVjdGx5IGNh
bGxlZCBmcm9tIHVzZXJzcGFjZSBjb2RlOgoKaW9jdGxzX2xpc3QuYzo0MzY6Mjk6IGVycm9yOiDi
gJh1MzLigJkgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlvbikKICA0MzYgfCAgICAg
eyBETUFfQlVGX1NFVF9OQU1FX0EsIC0xLCAtMSB9LCAvLyBsaW51eC9kbWEtYnVmLmgKICAgICAg
fCAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4KaW9jdGxzX2xpc3QuYzo0Mzc6Mjk6IGVycm9yOiDi
gJh1NjTigJkgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlvbikKICA0MzcgfCAgICAg
eyBETUFfQlVGX1NFVF9OQU1FX0IsIC0xLCAtMSB9LCAvLyBsaW51eC9kbWEtYnVmLmgKICAgICAg
fCAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4KClJlcGxhY2luZyB1MzIvdTY0IGJ5IF9fdTMyL19f
dTY0IGlzIHN1ZmZpY2llbnQgdG8gc29sdmUgdGhlIHByb2JsZW0uCgpGaXhlczogYzExZTM5MWRh
MmE4ICgiZG1hLWJ1ZjogQWRkIGlvY3RscyB0byBhbGxvdyB1c2Vyc3BhY2UgdG8gZmx1c2giKQpT
aWduZWQtb2ZmLWJ5OiBKw6lyw7RtZSBQb3VpbGxlciA8amVyb21lLnBvdWlsbGVyQHNpbGFicy5j
b20+Ci0tLQogaW5jbHVkZS91YXBpL2xpbnV4L2RtYS1idWYuaCB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL3VhcGkvbGludXgvZG1hLWJ1Zi5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L2RtYS1idWYuaApp
bmRleCA3ZjMwMzkzYjkyYzMuLmY3NmQxMTcyNWM2YyAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBp
L2xpbnV4L2RtYS1idWYuaAorKysgYi9pbmNsdWRlL3VhcGkvbGludXgvZG1hLWJ1Zi5oCkBAIC00
NCw3ICs0NCw3IEBAIHN0cnVjdCBkbWFfYnVmX3N5bmMgewogICogYmV0d2VlbiB0aGVtIGluIGFj
dHVhbCB1YXBpLCB0aGV5J3JlIGp1c3QgZGlmZmVyZW50IG51bWJlcnMuCiAgKi8KICNkZWZpbmUg
RE1BX0JVRl9TRVRfTkFNRQlfSU9XKERNQV9CVUZfQkFTRSwgMSwgY29uc3QgY2hhciAqKQotI2Rl
ZmluZSBETUFfQlVGX1NFVF9OQU1FX0EJX0lPVyhETUFfQlVGX0JBU0UsIDEsIHUzMikKLSNkZWZp
bmUgRE1BX0JVRl9TRVRfTkFNRV9CCV9JT1coRE1BX0JVRl9CQVNFLCAxLCB1NjQpCisjZGVmaW5l
IERNQV9CVUZfU0VUX05BTUVfQQlfSU9XKERNQV9CVUZfQkFTRSwgMSwgX191MzIpCisjZGVmaW5l
IERNQV9CVUZfU0VUX05BTUVfQglfSU9XKERNQV9CVUZfQkFTRSwgMSwgX191NjQpCiAKICNlbmRp
ZgotLSAKMi4yOC4wCgo=
