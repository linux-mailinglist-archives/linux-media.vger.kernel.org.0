Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4D51A843E
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 18:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388582AbgDNQLg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 12:11:36 -0400
Received: from mail-eopbgr140077.outbound.protection.outlook.com ([40.107.14.77]:41634
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733133AbgDNQLd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 12:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yydiogp/vpSSLH9eN5GUoWOL0zbpmAr1t2AyqgGKMk=;
 b=zxglla7JfSjehbSOOWBtOzmDU2lrnveS40//W28a5JG2PQHGZP81CkOQTzVRP0QUvftt1W3q1sifbOVihtYgpqJWm2A9AuzPXszMZoRrGrY4+omNxKmnNtvwXDB+j5Zd7ObuPPgCdnkr1bF8l2RMR1taD62vkOpb05x0DRMJ1Xk=
Received: from DB7PR03CA0073.eurprd03.prod.outlook.com (2603:10a6:10:72::14)
 by AM0PR08MB3010.eurprd08.prod.outlook.com (2603:10a6:208:56::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.24; Tue, 14 Apr
 2020 16:11:27 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::86) by DB7PR03CA0073.outlook.office365.com
 (2603:10a6:10:72::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Tue, 14 Apr 2020 16:11:27 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Tue, 14 Apr 2020 16:11:26 +0000
Received: ("Tessian outbound 1425309d4c0b:v50"); Tue, 14 Apr 2020 16:11:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 26e05b3691a9ae19
X-CR-MTA-TID: 64aa7808
Received: from 89ec91102164.2
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id CF887E83-87FF-4846-87F7-02781593BB87.1;
        Tue, 14 Apr 2020 16:11:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 89ec91102164.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 14 Apr 2020 16:11:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsAzFIbfjFkGjp1icb26SWzM9WbH2pQ/fdTeEd4fjfZgRwy+nUTaM1nyizrLE7A7gvLkqCKmFhCXAVvSemOkcxqA00nuq9mp/eNqhJokvAxhMoz+6xHDnS39OM3SBgOtnAXwtJBhO2OVXpZuhVv3PaJ7As+HD76+pzf7MEnHNA7iXfjEmcafBtAyB/0QUTMQo2OfFVLZRJEA7QOqQRXPBQGaXnXsxvWOGinw0AQPKwupMSNxSGhtOG5Vdh241gvXI0/wkkqkIDULhful5MtMp86Oup4l/Q32nxz34M1LJQpR6ZnuTP6fG2B2Voa5BsyJOIrVIW1g0HYtjAqKtrTJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yydiogp/vpSSLH9eN5GUoWOL0zbpmAr1t2AyqgGKMk=;
 b=ABt9zGaVau9grSJ7QHP3B6uvsdTmghRuyjkmoA5IsaaCmeeJvL/6gYJYN0Mk/INjTDh0g5zNfe+FG03xLj7EkkBDqDWTXly7o824Y2uqd+vreKRSMjWOsZElMI9D5ZINf1ZRjvk1bgnsBZlI3mw6q6G7rlm5P1bL7tiARHFf/ZVfIYMsa1Mo5QSJ6YQnPGo+r25Ng487Z2epq8IZp3dqDPauZEU1s6u9B24+0S+qbFq4fB6SCfSMazHoVqOLMXVNJmPYAXuF8XESOk5lLYswrR+fYYd6oLcE04AaPzeL55Cfqu6KgjKAol7fzDQEKCnDlEE6oYgR7U4LOYOCcbZYfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yydiogp/vpSSLH9eN5GUoWOL0zbpmAr1t2AyqgGKMk=;
 b=zxglla7JfSjehbSOOWBtOzmDU2lrnveS40//W28a5JG2PQHGZP81CkOQTzVRP0QUvftt1W3q1sifbOVihtYgpqJWm2A9AuzPXszMZoRrGrY4+omNxKmnNtvwXDB+j5Zd7ObuPPgCdnkr1bF8l2RMR1taD62vkOpb05x0DRMJ1Xk=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Orjan.Eide@arm.com; 
Received: from VI1PR08MB3885.eurprd08.prod.outlook.com (2603:10a6:803:c1::32)
 by VI1PR08MB3245.eurprd08.prod.outlook.com (2603:10a6:803:48::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Tue, 14 Apr
 2020 16:11:18 +0000
Received: from VI1PR08MB3885.eurprd08.prod.outlook.com
 ([fe80::c198:5f6d:b7d5:d80a]) by VI1PR08MB3885.eurprd08.prod.outlook.com
 ([fe80::c198:5f6d:b7d5:d80a%7]) with mapi id 15.20.2900.028; Tue, 14 Apr 2020
 16:11:18 +0000
Date:   Tue, 14 Apr 2020 18:11:14 +0200
From:   =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     nd@arm.com, anders.pedersen@arm.com, john.stultz@linaro.org,
        Laura Abbott <labbott@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
        Todd Kjos <tkjos@android.com>,
        Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <christian@brauner.io>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>, devel@driverdev.osuosl.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: android: ion: Skip sync if not mapped
Message-ID: <20200414161114.GA1949@e123356-lin.trondheim.arm.com>
References: <20200414134629.54567-1-orjan.eide@arm.com>
 <20200414141849.55654-1-orjan.eide@arm.com>
 <20200414142810.GA958163@kroah.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200414142810.GA958163@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: LNXP265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::23) To VI1PR08MB3885.eurprd08.prod.outlook.com
 (2603:10a6:803:c1::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123356-lin.trondheim.arm.com (217.140.106.39) by LNXP265CA0059.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5d::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17 via Frontend Transport; Tue, 14 Apr 2020 16:11:16 +0000
X-Originating-IP: [217.140.106.39]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dba5c3f0-d37a-4ffe-d4d6-08d7e08e7c31
X-MS-TrafficTypeDiagnostic: VI1PR08MB3245:|VI1PR08MB3245:|AM0PR08MB3010:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB30104A02C2F178CEEEDE75BB90DA0@AM0PR08MB3010.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-Forefront-PRVS: 0373D94D15
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3885.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(956004)(186003)(16526019)(7696005)(5660300002)(55016002)(6916009)(7416002)(4326008)(1076003)(8936002)(8676002)(66946007)(66476007)(66556008)(26005)(86362001)(81156014)(54906003)(52116002)(478600001)(316002)(33656002)(2906002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Dhv93vAQAhJb7czi4xmPXZLRqgicO3I0uOdw61eZSj3N3Dg/Ch4kSnw/7PCjKjzOcGvpoL8o3QZQ9pQ6SsOd82pEGbNC2pcRipVup+I71PHro2P0kr1gqN+RZmfyLIJFp8Cu+OSQgs+RwC/cp+A0tPufndXy57JDKh8gxwPU1CO8A19RAZ5BBA1kUJ2D4G2lJ9vuVrW1M4hf6M9xYQhn1hlvus63RbXwGf2Ccxkq54dokoE+BFuWuUmXtxIxRbU9rHavqVrnd5PYAmlc38FekQmu9enMhlpo/hr3Z1esfWw27bz1afNAwWzjJyOmzzX/bM+q/0PIQVAMzK+ftuYP5EdpjA+1fJfgNvOK8Cl2Qik2WkeOr5k13DlAm81e2H6JduBIsmp1y4dnPwTb5h3NnqiUE4o2b4Rt+s/JmtkpjbKfj2gDXN4Oy24SKOaiJfZc
X-MS-Exchange-AntiSpam-MessageData: 1uF5qULJhFHboj8XThKK5tcPpV+cUpY4PgA02oaeYrbTY1qLPiPCKiYdXi87TZHbVbsHdYd7+ekqCjLTHC1OfYJBg5/9x8RbMsJtBgultKeA/+oB0oLtbhwSNXwMGnggI+sJm1KhWUhXmwm172DPLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3245
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Orjan.Eide@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(39850400004)(376002)(346002)(136003)(46966005)(26826003)(82740400003)(47076004)(4326008)(86362001)(33656002)(956004)(7696005)(6862004)(2906002)(81156014)(81166007)(8676002)(26005)(450100002)(8936002)(5660300002)(316002)(1076003)(55016002)(478600001)(336012)(356005)(70206006)(186003)(54906003)(70586007)(16526019);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 15aa1b9e-0b0a-4c33-e3db-08d7e08e76c7
X-Forefront-PRVS: 0373D94D15
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: St7teV8yExN3tHEcVHFpfcupNRgoIkfBAM3qqiAe+ACZSdtbMwOHcg0kcTLkByhS1uNn3jN0FH+Vw6NamJMcZr0oVZzpbJgLt/uOzUFit6sagBOJxVjnkzDfkrHDMBy11a9VJa3mhIPYhgdnLC0/cDYwc9mVtZGdfGBeWv8aKVMs2zUZrJjdCZ5oXYJ2SroDbu4VlO39+eeQDNnhEnPDvcCGc2U0IIuHWfeCQovcOv2vOvlvBFf8CZPlqC7LbVMfoVQyiOLXwQHc7nhDa9TP0zLj8SDPVyY8GTo7+aETmDKf1qdI5l9hurRB6jEwqNPn7qhqFjCk6/UTY9AfQfhcrbPS7slnSDXg6w6b5JK2WnHB0i3IoqyACJlIrVIjHMyhTOMCxjOquWWIFNcBIv0DgN0Ilserg4u3sROoAFU22j62rGzt/NFINaEKTusLsprvFxOwSZSDpMpYFmgd3rTw8wOPXmhQ74CDCbV8Ge6U8nS2TXIFBU/goz3HGDlhChYtpn2Klgg89BKco5u7LCzGBw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2020 16:11:26.9742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dba5c3f0-d37a-4ffe-d4d6-08d7e08e7c31
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3010
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 14, 2020 at 04:28:10PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 14, 2020 at 04:18:47PM +0200, �rjan Eide wrote:
> > Only sync the sg-list of an Ion dma-buf attachment when the attachment
> > is actually mapped on the device.
> > 
> > dma-bufs may be synced at any time. It can be reached from user space
> > via DMA_BUF_IOCTL_SYNC, so there are no guarantees from callers on when
> > syncs may be attempted, and dma_buf_end_cpu_access() and
> > dma_buf_begin_cpu_access() may not be paired.
> > 
> > Since the sg_list's dma_address isn't set up until the buffer is used
> > on the device, and dma_map_sg() is called on it, the dma_address will be
> > NULL if sync is attempted on the dma-buf before it's mapped on a device.
> > 
> > Before v5.0 (commit 55897af63091 ("dma-direct: merge swiotlb_dma_ops
> > into the dma_direct code")) this was a problem as the dma-api (at least
> > the swiotlb_dma_ops on arm64) would use the potentially invalid
> > dma_address. How that failed depended on how the device handled physical
> > address 0. If 0 was a valid address to physical ram, that page would get
> > flushed a lot, while the actual pages in the buffer would not get synced
> > correctly. While if 0 is an invalid physical address it may cause a
> > fault and trigger a crash.
> > 
> > In v5.0 this was incidentally fixed by commit 55897af63091 ("dma-direct:
> > merge swiotlb_dma_ops into the dma_direct code"), as this moved the
> > dma-api to use the page pointer in the sg_list, and (for Ion buffers at
> > least) this will always be valid if the sg_list exists at all.
> > 
> > But, this issue is re-introduced in v5.3 with
> > commit 449fa54d6815 ("dma-direct: correct the physical addr in
> > dma_direct_sync_sg_for_cpu/device") moves the dma-api back to the old
> > behaviour and picks the dma_address that may be invalid.
> > 
> > dma-buf core doesn't ensure that the buffer is mapped on the device, and
> > thus have a valid sg_list, before calling the exporter's
> > begin_cpu_access.
> > 
> > Signed-off-by: �rjan Eide <orjan.eide@arm.com>
> > ---
> >  drivers/staging/android/ion/ion.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > Resubmit without disclaimer, sorry about that.
> > 
> > This seems to be part of a bigger issue where dma-buf exporters assume
> > that their dma-buf begin_cpu_access and end_cpu_access callbacks have a
> > certain guaranteed behavior, which isn't ensured by dma-buf core.
> > 
> > This patch fixes this in ion only, but it also needs to be fixed for
> > other exporters, either handled like this in each exporter, or in
> > dma-buf core before calling into the exporters.
> > 
> > diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
> > index 38b51eace4f9..7b752ba0cb6d 100644
> > --- a/drivers/staging/android/ion/ion.c
> > +++ b/drivers/staging/android/ion/ion.c
> 
> Now that we have the dma-buff stuff in the tree, do we even need the
> ion code in the kernel anymore?  Can't we delete it now?

It looks like the new dma-heaps have the same issue as ion. The
heap-helpers also do dma_sync_sg_for_device() unconditionally on
end_cpu_access which may happen before dma_map_sg(), leading to use of
the 0 dma_address in the sg list of a, yet unmapped, attachment.

It could be fixed in dma-heaps just like this patch does for ion. Is
patch a valid way to fix this problem? Or, should this rather be handled
in dma-buf core by tracking the mapped state of attachments there?

-- 
�rjan
