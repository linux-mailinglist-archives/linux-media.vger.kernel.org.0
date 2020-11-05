Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55F72A88D8
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 22:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731234AbgKEVUQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 16:20:16 -0500
Received: from mail-vi1eur05on2072.outbound.protection.outlook.com ([40.107.21.72]:10561
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726729AbgKEVUQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 16:20:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBGYRIXrUVqAPCiE3KzNtMcNndj8RZ9gKeeFxvYRqzZb4UirE2/1TZESqxZP8PWqTn9dR3o75suiK+gzVZ8G52qZKGTC7bpqFGfKvX6Ptyoo0rTuVtGVLYxMW2amwAnZzNqhqjbWQ0zKk2fzAxl5x7jz9Xf4LxW4CFQonWMdgIt9OVMwANnUn9Nk5o7G8A1EmoOa+tnhES89BBQvDSRnAvsKVLKvgtUk7JDhiVpwaXosIw5UzrjFuIw5LhL3R45/THZRskVqmR5RU2xUqYAkIXUix6nouypLIvjIr+s64CLEjH/kKvtU+/1ed87K2TGHWqV0pD9ymDdoVOjanPYEew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTdoGZj7CK/D2dJ/yHsfCDFlJMTRqml24Zc5BkArBAc=;
 b=NdMceYn65jL3VFtJn6BkvTEh28lp+TNDBxl0xxtzR7V7G7rykeZ0TpKnNzpJkE+yJajU9zSW1J0Ee0ocN6gWWng4kPrcGPOkMlQx/yn9j6e3wKoiQjHyO1odvSaGF4mSnOoYbm1Oy9tJAfZTbVdCBoaQHOCWf2ubd1mHHvTUJPwisXRGDvLudrR2usUfwFzeiJS/LoFh6vSH2Y2xwNc6U4q+OKCM852d5E9zjOFS6E5Jeo+ie0oIaJ/EAc8j0WdtECfwtsqcUWML6IyvFwA9JD0ld6qMBGLHnMhz0qGLklwYoMDMIn/ogV1amgu5KsFcE0u5HRiP6wD45fMNJx+Tbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTdoGZj7CK/D2dJ/yHsfCDFlJMTRqml24Zc5BkArBAc=;
 b=WmzbITGfYxkzDfVXHDmu4x1jD3sfNbpA5h3hezYenfV3xHvfzmk5PFp1MKm057cGiHlXz1uVZ/Xd2jZHU6P4RodGgogSEvnawfm80ej9nKIcKP1c6nDPItOAkguqXUBICSSkO03N4rzo/0STQolDKpmiuRB3nES2d7lIREDvNH0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=wolfvision.net;
Received: from VI1PR08MB4592.eurprd08.prod.outlook.com (2603:10a6:803:bc::19)
 by VE1PR08MB5805.eurprd08.prod.outlook.com (2603:10a6:800:1aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 5 Nov
 2020 21:20:12 +0000
Received: from VI1PR08MB4592.eurprd08.prod.outlook.com
 ([fe80::58fe:ecaa:744a:c338]) by VI1PR08MB4592.eurprd08.prod.outlook.com
 ([fe80::58fe:ecaa:744a:c338%3]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 21:20:12 +0000
To:     linux-media@vger.kernel.org
From:   Michael Riesch <michael.riesch@wolfvision.net>
Subject: Does uvcvideo support dynamic format changes?
Message-ID: <4f4d5537-4c83-ac22-c650-292d149fcda3@wolfvision.net>
Date:   Thu, 5 Nov 2020 22:20:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2a05:1141:1c9:7c00:ad8b:c078:f634:d22a]
X-ClientProxiedBy: ZR0P278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::17) To VI1PR08MB4592.eurprd08.prod.outlook.com
 (2603:10a6:803:bc::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a05:1141:1c9:7c00:ad8b:c078:f634:d22a] (2a05:1141:1c9:7c00:ad8b:c078:f634:d22a) by ZR0P278CA0007.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 21:20:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fbc7f84-9278-4ccb-e1ee-08d881d094d0
X-MS-TrafficTypeDiagnostic: VE1PR08MB5805:
X-Microsoft-Antispam-PRVS: <VE1PR08MB58053D934A8B0FF3DE15B2B0F2EE0@VE1PR08MB5805.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 432owKOxFQC+vj0V60DG4sSvY8oe1K7a2OFuJZRlgLkEQVT7Nd3MksOpj3QfISgouw0LTFzerAaqhsZXGNRm/0nDIHD7s3X/0t9MWaq/48xbTrSABZBdKIBJpJ/5TRrTCsYCT1pJ3T5/hqqDZ3jTccKPdqrkWYoCX85EftnruNQYOyFt4BEFDFnqBNBhMdr5bZSjkS+ZTDt345Y/mj6zhW9R+W2EHee0KKPYAP/v+hbs9tij/HvmsK8cwgGFno02HbglR719TDfLbcnYk5Jrv+dnfCI3hcrc6WMaGDWeEw2PMXy6ADF2ZrWyksKF46O268yBgxxjagd+UMUFly2tcQ++urDgEozh7DIvz/wgOVMA2W+S7rfOaLpgt/CtjU/s
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB4592.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39830400003)(366004)(44832011)(186003)(31696002)(8936002)(8676002)(31686004)(2616005)(16526019)(6916009)(36756003)(2906002)(4744005)(52116002)(66946007)(478600001)(86362001)(316002)(66556008)(83380400001)(6486002)(5660300002)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: N++nqVTgOV/wLB+yiT1N3j5/LhCxK0t/dIrGwMGVyCJMm0LR7A4+nQ9rdkiIzX47379nzi6IJDBa3jbolUdwHMdfBfynYv0CbXCjwThIXeeyr5afUu/NYvcysooTW9O66hg21gjiCm6XqEnCZEY6ZnXbL3AWnfkyYz0zHoty1U16fE4UYJKp4MzngIl+0C5f3C1B44GaaCKPW18VEAKOYty4/E1CU00QLxHPzs7MKw0j9ofevOOcPUKWJnzWeW1OjLVuCtwJwoDbxtC1+73KEFPbcjwpaXIhZ3y+m+55N1p61jYI2jC/d2Id/bTS5Dq4CTA3BW0zjJw5RZ7HqfnhRNHs6zbj9qo+U3SG7xI+ZK3y+pcNzziSwiM+CacWGCzU72C0ir1AEsrn6fzj3beCbqnD4MIU4l3/HP4jN+KDjQ9pabXPCsgEdQn4zTwgpiRvY2eKATzugmpcBfWNIB4SI8u3oBPZ9DlMECnczECkd6fEGQcVlfWIa7/UKTwFfPrIsNfSxP3lqcVjeRGtgfoNmpUIDPgstOJz1zcZ48bmAofYxnT2D5Blxk4yQ3hvmkG3IgIzd1XLpCzWcGr/FJJZgfi0zNaXXrvZ1Miq539Ea7OgkFQ2Z/ZQQlUjiVbc6Ze/c704vbxead4a9B63cdvjEuzpmmVeUUogAIUHr8Tj5cx2n7u0Wz+PIjK6Q5z+RmZ/4Sl50IkoyXFRITo3JwlaKQ==
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbc7f84-9278-4ccb-e1ee-08d881d094d0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4592.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 21:20:12.4762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGlrBv7B0crfTPduAVjoG7hIVw/SyoCJl0HAbVxmDIdrhPdcfzXms5JMnRyUJBNlNfU5q+QcCk6Q1bFGD1QbD3VnmE3GBTg38Urlj0/IQF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5805
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all,

The USB video class standard specifies a procedure (USB Video Class 1.1,
Section 2.4.3.6, "Dynamic Format Change Support") that allows the format
of input data to be changed during streaming. As an example, one could
think of a media interface device that accepts a large range of
resolutions via DVI, HDMI, ... during runtime and aims to forward the
data without rescaling via USB. In this case, the input format is not
necessarily known at device enumeration and might change at a later point.

After a quick glance over the current uvcvideo code I am wondering
whether this feature is currently supported or (if not) whether there
are plans to add support. Also, is this feature actually implemented in
any device you have encountered?

Looking forward to any comments and/or pointers. Thanks in advance!

Best regards,
Michael
