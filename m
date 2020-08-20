Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCD524B1EA
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 11:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgHTJPs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 05:15:48 -0400
Received: from mail-vi1eur05on2083.outbound.protection.outlook.com ([40.107.21.83]:7265
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727011AbgHTJOq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 05:14:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIaNCLbbESJcPdW4g6MaX+0LafTvCaAoPkjRZd6VRm0=;
 b=zOp3rJMqM7bQ9phda8Hc2x+uOsCj08XHBdL5+sk6kT7AbWqVDboakN/VnhthK2ohWQ8Hpood3qihDC+eVIrlSrE2cKeDdhgZIwhdWwEbtmWjhyCwpQOOUZm7MVqNY52k6xPT/W8i93jnBmLs9VGEoeJjDAKyaBg5bNbmzP1OdME=
Received: from AM5PR1001CA0013.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::26)
 by AM6PR08MB3143.eurprd08.prod.outlook.com (2603:10a6:209:45::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 20 Aug
 2020 09:14:42 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::68) by AM5PR1001CA0013.outlook.office365.com
 (2603:10a6:206:2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Thu, 20 Aug 2020 09:14:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 09:14:42 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Thu, 20 Aug 2020 09:14:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5588458ae9d41b09
X-CR-MTA-TID: 64aa7808
Received: from f209b903142b.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3B7B3E3D-6D92-4BE1-9DC2-57D58A4A0C40.1;
        Thu, 20 Aug 2020 09:14:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f209b903142b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 20 Aug 2020 09:14:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzGNX+Fri3flIyQFioGdLFX10S5CTtHQccDbpiK7x1qwu9Q2wVykA91Ul6pvWTVsH996XmBYBgOa0gmZNnNSLQjPocVn2ND3RbWZsPTXDip/YWS9xz9iMK8DvN1zk/g0TNFwHfJuFjWZBVydpzMwwt/B0HI60RXS4X85vaarA5YtQBQy4MD1WJey5o4cQSv8dtoZPJ6Kcq1CwQm9m7rcmDPxSzbrhtrizo9oF1z5h1odY3ftERb/Mjfh7BF9/PbqVIDPHqBsaDlC83wKOTZlyp3YvjgxSwTJEWzlgu93mCnDOiqz6iOvKVSfprpPUcCaugi/jTHeW/D43/sTP+L9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIaNCLbbESJcPdW4g6MaX+0LafTvCaAoPkjRZd6VRm0=;
 b=Iy9H12d8eY5Nov/YSQ65gkrmhse/LboM5Qn6EyE76TITmdRpo/mKBDftiPZthwXzrC7OtVa3DcVrZXSSf9CanCOxUplvgS2/mWG+W6nDoWmqivG4N35p7BQSNo9fV8WLCU8QrL7DuhQQTttGPEdUtdyesa/7tcOp4i58NC9+T+QTLakkc1QgXR5ulyr8J8K3pNy5oVzfukXfG12N0TSIOjF+gYHXWYTdL/LqqoJNvZaLq+H66mQ0H5HpI44kR9wdtHuO4yKwz9j1Kl072VDDwaRYlheIOUMLOJ93+6Ew9tfshe5ULs4PdBXykg2Xy4pl2fFu945nfXIHNin+X88uiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIaNCLbbESJcPdW4g6MaX+0LafTvCaAoPkjRZd6VRm0=;
 b=zOp3rJMqM7bQ9phda8Hc2x+uOsCj08XHBdL5+sk6kT7AbWqVDboakN/VnhthK2ohWQ8Hpood3qihDC+eVIrlSrE2cKeDdhgZIwhdWwEbtmWjhyCwpQOOUZm7MVqNY52k6xPT/W8i93jnBmLs9VGEoeJjDAKyaBg5bNbmzP1OdME=
Authentication-Results-Original: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR0801MB1995.eurprd08.prod.outlook.com (2603:10a6:3:52::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24; Thu, 20 Aug 2020 09:14:33 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::14f5:cc22:9381:1d13]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::14f5:cc22:9381:1d13%6]) with mapi id 15.20.3283.028; Thu, 20 Aug 2020
 09:14:33 +0000
Date:   Thu, 20 Aug 2020 10:14:31 +0100
From:   Brian Starkey <brian.starkey@arm.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Daniel Stone <daniels@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Robert Beckett <bob.beckett@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        James Jones <jajones@nvidia.com>,
        "kernel@collabora.com" <kernel@collabora.com>, nd <nd@arm.com>
Subject: Re: [RFC] Experimental DMA-BUF Device Heaps
Message-ID: <20200820091431.a5im4tgwigy2z3vj@DESKTOP-E1NTVVP.localdomain>
References: <20200816172246.69146-1-ezequiel@collabora.com>
 <20200817151813.wet5faqg4fzlfbsh@DESKTOP-E1NTVVP.localdomain>
 <8fb2e5f7c2943df0d733fc604cafd547edd4b8ea.camel@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fb2e5f7c2943df0d733fc604cafd547edd4b8ea.camel@collabora.com>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LNXP265CA0081.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::21) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by LNXP265CA0081.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:76::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 09:14:31 +0000
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1058c640-6019-419e-f7b0-08d844e9795a
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1995:|AM6PR08MB3143:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3143B5D5ABEDF7945D645062F05A0@AM6PR08MB3143.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ut/Gickeqk0XIJtZWPAAWaVi5uv1OqWZii0Ga+jhlLmyLU45VJxr5SvFy1e0RZtok5N2Fit+zOARqnItwrmnljMebpdNDT2EIdTcyO+eNl6/XfdubRUeMJ9sL2UZxTHUkXHQ9muHrFPmFhaAZNsWpjljA1YnSsvFjmtXNB0H04EHihiztS//Iyjc3yl0+muP+OVE8ab7ZwjkZVYqcOuzCcFrpNLRAHOjwyRdyDm93hH5rXGqHLrIbIG36gAmyYfqcwfoHCugFuEsKgBLPUnTWZtFqOkxMsHZIMMcq/BBTUcEY/3Iv9TSd1kUfyFTQJ+1jsjPX+4lJ8TwrUM8KBRyHw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR08MB2890.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(86362001)(956004)(44832011)(2906002)(66946007)(66556008)(66476007)(5660300002)(7416002)(8676002)(8936002)(6916009)(186003)(54906003)(7696005)(16526019)(316002)(1076003)(478600001)(6506007)(55016002)(26005)(9686003)(52116002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: kS4a6lRceiIs4GxUUwMjVl5dL6szDvrGXFUR/QE+enTUWaK+CuJpCs78AYJH7ix97UWVyq4ZhvEJYErFmV1N9H5QsqnAxsYAfz/P4XPsrGdCqkSGnGgp8i18Ow2ILrd+5DwXFADtPU4sV92oxaOKCkgT4C1cFoZJlqJvbYaSBqMfyOUP3drBF6cuWESy6FG56DtAWUi3JX9osP+3pe/63HzL+ofb7v6n1HwqQH2ek3HLrUx0sJsDkwxW+R+pUrYatpULMTDd45qvsWlKE5S9GDTH3Idy1HI49Mh6CVWkexno2qaXofqqJ9ebZIeGnrogbIOJVqFqo7dMEbMyxGzddgNXHpkSD8UCTO+Xm6oREnbDosVtJKFpgjsQfjPf9i+Mh9tCM/F/7z4uM+NcroO5Kj6owo3WeIQfzJLMn0Q2/2Tq4tyZopuQ7pdNLHAKHMgcu7AovT0kRkxfIJ+/skzbDxjzrO0G7FKRbalptxCcWFVlX6biQT+9+ZdrQnE97mnbrVN4Cg5jEkKbsJadftDzIYO9EKsETOtJdsc3t2vqFZVzj/3YLgAKivahVyugF3HgpTYHTZ9xUCJZfbtw86xlM58AnSxC+FcRfSk1XEPImy3YGGzOnuM0vnH0fXVUGFJt0v76EYMMjBjj9rYK+F9p3A==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1995
Original-Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 06b41857-b7d0-4f10-a09e-08d844e9739a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5pFZful6Ad3DsE6Q3fxdL9mT2FBs0N9gsu+47uP9ezk+hNTUmiPzeJKeGfuT/3JWZyXZBJhKL9BQKgenx5wADrYp5T2KXgj6RimIP/AqTlmx6M/5Pe4OEiX7VYTTgiHqpWLY0oxoZOT+Skuw7FKpsNracFhU0vcSB7c21nHTZuhrNTpEtJSeqdDvSV8EJhySGMTI/Qsb/8Ybhv72xnFxGiWJISnkjiPMCCWGNAKXnS5m8XEuk/8ajQ4ihuQzRkjEUPimkNgbRnoF+LpqBJpHbnN3kiMeRKwwWOnDTgYd9kgfBeTiE4z/Mlge0Srx6vk1pMVX03qnvQwwScAjmhQT2kvtgV3SiongbuzmQNlxXLruD9/QAjeZ2Wxc5ymBsxZHgJ51PvE+QjO712arIfldjg==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966005)(956004)(54906003)(8676002)(1076003)(44832011)(47076004)(82740400003)(5660300002)(81166007)(8936002)(336012)(36906005)(478600001)(70206006)(6506007)(2906002)(82310400002)(316002)(70586007)(186003)(86362001)(16526019)(6862004)(9686003)(7696005)(356005)(4326008)(26005)(55016002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 09:14:42.5969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1058c640-6019-419e-f7b0-08d844e9795a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3143
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, Aug 20, 2020 at 09:07:29AM +0100, Ezequiel Garcia wrote:
> > For single-device allocations, would using the buffer allocation
> > functionality of that device's native API be better in most
> > cases? (Some other possibly relevant discussion at [1])
> > 
> 
> That may be true for existing subsystems.
> 
> However, how about a new subsystem/API wanting to
> leverage the heap API and avoid exposing yet another
> allocator API?
> 
> And then, also, if we have an allocator API, perhaps
> we could imagine a future where applications would only
> need to worry about that, and not about each per-framework
> allocator.

Yeah both are reasonable points. I was thinking in the context of the
thread I linked where allocating lots of GEM handles for process-local
use is preferable to importing loads of dma_buf fds, but in that case
the userspace graphics driver is somewhat "special" rather than a
generic application in the traditional sense.

I do think the best usage model for applications though is to use
libraries which can hide the details, instead of going at the kernel
APIs directly.

> 
> > I can see that this can save some boilerplate for devices that want
> > to expose private chunks of memory, but might it also lead to 100
> > aliases for the system's generic coherent memory pool?
> > 
> 
> The idea (even if PoC) was to let drivers decide if they are special
> enough to add themselves (via dev_dma_heap_add).

OK, that makes sense. I think it's tricky to know how many "special"
chunks of memory will already be hooked up to the DMA infrastructure
and how many would need some extra/special work.

Cheers,
-Brian
