Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2881ACD9E
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 18:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732097AbgDPQ0P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 12:26:15 -0400
Received: from mail-eopbgr140083.outbound.protection.outlook.com ([40.107.14.83]:32994
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728987AbgDPQ0N (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 12:26:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3BdR1s27uZzmOVlrwwjDDfw72acBDdM/TH3EcGetR4=;
 b=sG4vSqV+5BmngQU1CAW1eQUyt3KJ4XIhW8CQ0Vgb1UuYyVD7D8Jv5EWYh6exGWCeaXzWOa+ymype1U3+jnsNpyj7yFDxD8xWd/Hpb3wszCJBSR9MP5jFLbRZCkzMEQ1yd5DwqNM3Bcaeiq/MRYeOYrJsLDUvb6wSiRJql+6Ck9s=
Received: from DB6PR07CA0089.eurprd07.prod.outlook.com (2603:10a6:6:2b::27) by
 VI1PR08MB3965.eurprd08.prod.outlook.com (2603:10a6:803:dd::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25; Thu, 16 Apr 2020 16:26:06 +0000
Received: from DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::ea) by DB6PR07CA0089.outlook.office365.com
 (2603:10a6:6:2b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.5 via Frontend
 Transport; Thu, 16 Apr 2020 16:26:05 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT046.mail.protection.outlook.com (10.152.21.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Thu, 16 Apr 2020 16:26:05 +0000
Received: ("Tessian outbound a45624f5910b:v50"); Thu, 16 Apr 2020 16:26:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fa3ba1870b24abd5
X-CR-MTA-TID: 64aa7808
Received: from 5aae0455c5e3.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 21E994C9-E8E4-41D2-8AC2-F7CDD84DA639.1;
        Thu, 16 Apr 2020 16:26:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5aae0455c5e3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 Apr 2020 16:26:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGs5soOMZg1HYdXl2Iu3khPYqyWpeh3JDNAKZdJBt80epV1OwSeJ/ZC5PkJAJ/Y1dCrA+chauJ5ZlZLUjXts6DqO52eCICaeyrn2va22CXABVvx7SpdrS9df84hQKO6mDlJY6Fy4kz7X6FG/DcAobfU1N9pmIwkho0jl0gtOCI2kopyzQ8bh02ZJ6qVqrFvbIJOJxQ7lzSaY8HHe1qxTijOOGtom5L3kaVDgs5Iep6QEqbYmrTxLSJrR/8ixvx2UrednqQJUa197hqEOeU62lduAy5E3gxyEYfaPtLXBcDZ945opte3z+uW9Vtn/hiznDjJ53EHmU7P+RxppMCdyCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3BdR1s27uZzmOVlrwwjDDfw72acBDdM/TH3EcGetR4=;
 b=IAxii/XU/sU/GeIBenOpPoVRU3gr/Qq8ZgyulYkJfcMNU0gBSzmXyWn/4mHDi2QOVwWAgiCwGGeYUf/PLaPQsOEl8UVLZS3Y5elgjPs+Jlk1SaTSVDQHOgVuow+FP/11FoeI5NC3dkingD3cnPu/w1u0RJjNJBhe6RQ+IZjMATtKUg5dl8TJvHfLQ19mhGyiFhGLeoUduIXFgZ1hpRjD/sb9kjhvWSLNIZM/ggIGbod4OCNfNyinLNecBH9BqHnouWA6qB+8ri4OHlSZ5PHxCrbXLaj1PdJQLaZONAFu0+WitmdIlwa9pdLAZMJcFLAg54Dwt6aR/6JGYN4sPSSEww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3BdR1s27uZzmOVlrwwjDDfw72acBDdM/TH3EcGetR4=;
 b=sG4vSqV+5BmngQU1CAW1eQUyt3KJ4XIhW8CQ0Vgb1UuYyVD7D8Jv5EWYh6exGWCeaXzWOa+ymype1U3+jnsNpyj7yFDxD8xWd/Hpb3wszCJBSR9MP5jFLbRZCkzMEQ1yd5DwqNM3Bcaeiq/MRYeOYrJsLDUvb6wSiRJql+6Ck9s=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Orjan.Eide@arm.com; 
Received: from VI1PR08MB3885.eurprd08.prod.outlook.com (2603:10a6:803:c1::32)
 by VI1PR08MB3821.eurprd08.prod.outlook.com (2603:10a6:803:b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Thu, 16 Apr
 2020 16:25:58 +0000
Received: from VI1PR08MB3885.eurprd08.prod.outlook.com
 ([fe80::c198:5f6d:b7d5:d80a]) by VI1PR08MB3885.eurprd08.prod.outlook.com
 ([fe80::c198:5f6d:b7d5:d80a%7]) with mapi id 15.20.2921.027; Thu, 16 Apr 2020
 16:25:58 +0000
Date:   Thu, 16 Apr 2020 18:25:54 +0200
From:   =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     devel@driverdev.osuosl.org, nd@arm.com,
        Todd Kjos <tkjos@android.com>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org,
        Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
        john.stultz@linaro.org, anders.pedersen@arm.com,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Joel Fernandes <joel@joelfernandes.org>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        Laura Abbott <labbott@redhat.com>,
        Martijn Coenen <maco@android.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Brauner <christian@brauner.io>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: android: ion: Skip sync if not mapped
Message-ID: <20200416162554.GA34684@e123356-lin.trondheim.arm.com>
References: <20200414134629.54567-1-orjan.eide@arm.com>
 <20200414141849.55654-1-orjan.eide@arm.com>
 <20200416094955.GM1163@kadam>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200416094955.GM1163@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: LO2P123CA0067.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::31) To VI1PR08MB3885.eurprd08.prod.outlook.com
 (2603:10a6:803:c1::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123356-lin.trondheim.arm.com (217.140.106.39) by LO2P123CA0067.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend Transport; Thu, 16 Apr 2020 16:25:56 +0000
X-Originating-IP: [217.140.106.39]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1e305482-265a-4e0f-ad52-08d7e222dcd8
X-MS-TrafficTypeDiagnostic: VI1PR08MB3821:|VI1PR08MB3821:|VI1PR08MB3965:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3965F26824740D1ACCEF9C1A90D80@VI1PR08MB3965.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-Forefront-PRVS: 0375972289
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3885.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(4326008)(16526019)(186003)(33656002)(2906002)(956004)(1076003)(66946007)(81156014)(8676002)(316002)(7416002)(66476007)(5660300002)(66556008)(86362001)(54906003)(7696005)(52116002)(478600001)(6916009)(8936002)(55016002)(26005);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Zv8Nc5HFYTPJ9KYPU0GGQdfTY7ArLUJ8Sqej2v7WL/m1fnegNmK0S2LNPeMGb7fPX9QO5paJy2q3eH22jafSoGQvP5Trv+RJ6RkinYBYbYKj0XLrkIfNfIKF0VqYNEBgOm2301/eGKlFeYSu2pj68BqI9aOMfot7cORvma7FxUYN9q8SCw5PvgrBBVNY7IOihDlZVQ3+yzThPL6eHI2+if9esGlm+9mOLmqw7T8Q7cQxUox/ZPaAwLOOWDPpCGxzDGHsVA+VB2U2JWF3TjBVz3xSOe4Fu2siX0948Zk9Jkv6UvAhuu1EPkRx6KYA36zHIBYwxWpr7HbHnQ88oUJqnFi6Bt9dK1OfsOrrxEhMgEmCLsfgWMhI0wLpm80mK2U4cuRjc1X/Afcycz9Ca+o4YW6SwZla8igjrCLlE6c6kzewaevuA6dMYQwXjL6Nb1eb
X-MS-Exchange-AntiSpam-MessageData: 4jV8i4ahR/9jmwAtTANWLh4TicU8nrLMmeJUs2AH7NjrYsxyUf+CYAEdJMTGe1mm4/nd18rvBFZF4SgScsQ1GalUOd/sm35gmCZ2WpNuv8v9Krze370ARXYqX+mM3WcWSphRc1mPo+KeiW8HAZ2XCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3821
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Orjan.Eide@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(46966005)(316002)(5660300002)(26826003)(54906003)(70586007)(2906002)(478600001)(70206006)(336012)(6862004)(186003)(16526019)(956004)(86362001)(4326008)(450100002)(55016002)(7696005)(82740400003)(1076003)(81166007)(356005)(26005)(47076004)(8676002)(33656002)(81156014)(8936002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 06983a84-bf67-482f-f2ff-08d7e222d837
X-Forefront-PRVS: 0375972289
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p1316rHwHKMl/pjPd5R4RduBMZJB53khYhNMGDaLsT01WucCFCcnUfVRQvjWtiBHP27cawvlnDTpOm7N3mTRVjcnX3MNOCaj4HLENhIRVff7zWqtnbNumOUaCt8HjINYl+qPLBtu+mamw82X4SSer1mcnmrArNTlEKt+j7MKXsBbolw3xX+tSuL9xlyao4cCKyA1tAxzsp3oad1QHDGrMUkdiBlnBQIUTucosN0Dv9qwjdA+P1IIgfEWUhmr39P3kQNsMET6305xhbl6Z8Gd/Z/M90F1XL7lQ6dOck32sapsSw7GqpvMoq76Tc1mX4ngcpHeUPP4BFeETHWcELF4Du/yl8Wc3XQEGLHT8XwLuEDhowLrvlJsZiGZsY2pxbDcLEAU0QaSDKv9v8jM+q630/oRHvUPEGbTJMfCgNogMvg5V3SUhsrLbVosWgxJqJm2jU3z0q3SZfby/1bpsdBAUM/spM6RoU0m854CdlTHHll5vrkYxN4k3dbjMOTagJbSKxyO2HBMjk/fHCkGTUhnmA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2020 16:26:05.8077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e305482-265a-4e0f-ad52-08d7e222dcd8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3965
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 16, 2020 at 12:49:56PM +0300, Dan Carpenter wrote:
> On Tue, Apr 14, 2020 at 04:18:47PM +0200, Ørjan Eide wrote:
> > @@ -238,6 +242,10 @@ static void ion_unmap_dma_buf(struct dma_buf_attachment *attachment,
> >  			      struct sg_table *table,
> >  			      enum dma_data_direction direction)
> >  {
> > +	struct ion_dma_buf_attachment *a = attachment->priv;
> > +
> > +	a->mapped = false;
> 
> Possibly a stupid question but here we're not holding a lock.  Is
> concurrency an issue?

Thanks for taking a look.

Here and in ion_map_dma_buf(), where mapped is set, this should be safe.
The callers must synchronize calls to map/unmap, and ensure that they
are called in pairs.

I think there may be a potential issue between where mapped is set here,
and where it's read in ion_dma_buf_{begin,end}_cpu_access(). Coherency
issues the mapped bool won't blow up, at worst the contents of the
buffer may be invalid as cache synchronization may have been skipped.
This is still an improvement as before it would either crash or sync the
wrong page repeatedly.

The mapped state is tied to the dma_map_sg() call, so we would need take
the buffer->lock around both dma_map_sg and setting mapped to be sure
that the buffer will always have been synced.

> > +
> >  	dma_unmap_sg(attachment->dev, table->sgl, table->nents, direction);
> >  }
> >  
> > @@ -297,6 +305,8 @@ static int ion_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> >  
> >  	mutex_lock(&buffer->lock);
> >  	list_for_each_entry(a, &buffer->attachments, list) {
> > +		if (!a->mapped)
> > +			continue;
> >  		dma_sync_sg_for_cpu(a->dev, a->table->sgl, a->table->nents,
> >  				    direction);
> >  	}

-- 
Ørjan
