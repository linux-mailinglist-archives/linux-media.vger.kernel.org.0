Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D519B742912
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 17:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232449AbjF2PEt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jun 2023 11:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232491AbjF2PEq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jun 2023 11:04:46 -0400
X-Greylist: delayed 894 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 29 Jun 2023 08:04:43 PDT
Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71AB30F0
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 08:04:43 -0700 (PDT)
Received: from 104.47.7.174_.trendmicro.com (unknown [172.21.19.51])
        by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id C9F11108D82D5
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 14:49:52 +0000 (UTC)
Received: from 104.47.7.174_.trendmicro.com (unknown [172.21.199.100])
        by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 244D210001234;
        Thu, 29 Jun 2023 14:49:51 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1688050178.713000
X-TM-MAIL-UUID: 67d40f0c-723f-4a07-8140-b912dc22be84
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.174])
        by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id AE4621000031D;
        Thu, 29 Jun 2023 14:49:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoHXcDuy99jLDXURhUlzN4gyxFPzpfAW/RjP7u1MabxjTigrWqk3G2PhkgdUkxFAV/Je+bf7ZEQSvR2R8G+SJiisScaB36bmX9vaSraYfts8OQGROgpu99NrbacZenCrOIjzOJoqvtWWOOm3OuL+++mhxo4JLnarEXD6BKeG+zy6yhPi5B0A0LjWHM97nnyrhSZUcnkozkyu3uLy40WoFMzGLX6s+KskZ8okOAYqeApCnEZcHfzjrjlAdA0hI6yNZmbWPEIvvKgQCNKYqIUYnpWuATZmaIkQt/h5REs6wcNzKUcpWrLTz/ktFnRIf/vQY7Cpv3GCH+ti33fWT2H3uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXE0H22iw+cpckPfVbWhUzcsGOxy+sHiyyCjodERnMY=;
 b=noXSRX0VcBc0eXPqSbBIeIu0R7ksQ++yaTlV6rYl7iveNve/k/urq3P0vbGcZLqzshcgD8EyCi22CYU224HzKjTawxZK0fOs2OEdfc5UOGYW0KLkevS7mSSKYdknxhvPWLwgUkvShPzRP7SxNqpavTuq7c4y6AJwzBAInX3YjFx7N3zQ26uuBRH6fNAMxqdIiv6Mi14cCZrzEr7BQO/5dWaDVqRE4MMCj0p6eyemujGAO/GA5BMiSSup56eiYdyyFk9BZ7LQFKrYo0bkjBt7nThlCX9PMO094IWNK/93b1gAw9G5J/NLG03xjDC5NxtUhOcnIQJTh2hKV2GeDEa7iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 217.66.60.4) smtp.rcpttodomain=chromium.org smtp.mailfrom=opensynergy.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=opensynergy.com; dkim=none (message not signed); arc=none
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 217.66.60.4)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=opensynergy.com;
Received-SPF: Pass (protection.outlook.com: domain of opensynergy.com
 designates 217.66.60.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.66.60.4; helo=SR-MAIL-03.open-synergy.com; pr=C
From:   Alexander Gordeev <Alexander.Gordeev@opensynergy.com>
To:     virtio-comment@lists.oasis-open.org,
        virtio-dev@lists.oasis-open.org
Cc:     Alexander Gordeev <Alexander.Gordeev@opensynergy.com>,
        Albert Esteve <aesteve@redhat.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        alex.bennee@linaro.org,
        Andrew Gazizov <andrew.gazizov@opensynergy.com>,
        Andrii Cherniavskyi <andrii.cherniavskyi@opensynergy.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Enrico Granata <egranata@google.com>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marcin Wojtas <mwojtas@google.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>, Matti.Moell@opensynergy.com,
        bag@semihalf.com, bgrzesik@google.com, hmazur@google.com,
        mikrawczyk@google.com, srosek@google.com, zyta@google.com,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Subject: [RFC PATCH v8 0/1] Virtio video device specification
Date:   Thu, 29 Jun 2023 16:49:14 +0200
Message-Id: <20230629144915.597188-1-Alexander.Gordeev@opensynergy.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1EUR05FT039:EE_|FR0P281MB2046:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0bf81e8f-0f0a-4dbe-b644-08db78b00f99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zX2xceQkmOiDI1mEwvCjEjCRe+ZctXd5Dxrfzho9lSMu7dzcifEGX8+h/12j1PfzA8vbfbPpDxZ+DHc2wQOcEigZAJHl1LNcesaSypJGONx7UDeRPh6fmuMQKsWH21KX+RkB9hg/dVKHFM3DJgjEJLmjdp2dfdj25hA5A0iu0MIB1tE+mah4twICr6MG4vYtv7paeEGuRQyEnRlXkNwPOikjAP5Yu5E4vI7MAu+BZil3eVuIxTNrIqycBHL5bpcFIZfzg9y1XkqAk1DwCS8YZi7nwdPKm4jDtAu2FV1HSmXT+3ogHpJoguEOXa+83ALQ6LzBHoAWDq9iTnIKLKUvhnc/tuDX8GhsrRWyRsqyyj6TWUCbYGmJ/du71pBoV//dfrEdP9HkSd6UUze/yP8/5Q+Imtzi4pC/CodYLtr6EnUkz62eCvZFX3JZB68E+Y7C8oUHA/KgBVe7elPFJiTVKe23Bwc8gsCt5hm7tRzjFfIQ9lKJJw1e/rYO+jaHHfAWR0yCv6LMKwZbJY0CqNCd56Gss0lrBMjozhgHKpBXIMHtq0GHT1OQ3aAZZie5xrq+chsIguU4J+8B3z4VgKmvJtHpazcDjgyb3T6jFXO9mtIrvgEa7sJlBYqGEcgHceUHsobmfjY1xYfaPCvMzojAQC7LrewaO28j0aaDpkEGogXNZulBvH6lHKIQxPyhdr8bVfSMTgtOWiarzH0U2lo6zklY90Wmyggn3W5++aWnIx7fKjz7qXIXsTVBpFPsPOCvBjhV3HFLkgsCbad+au/OOg==
X-Forefront-Antispam-Report: CIP:217.66.60.4;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(396003)(376002)(39840400004)(346002)(136003)(451199021)(46966006)(36840700001)(7416002)(5930299015)(1076003)(5660300002)(336012)(4326008)(316002)(70206006)(478600001)(36756003)(70586007)(8676002)(8936002)(2906002)(186003)(54906003)(966005)(36860700001)(42186006)(40480700001)(41300700001)(82310400005)(86362001)(81166007)(47076005)(26005)(2616005)(83380400001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 14:49:37.3585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf81e8f-0f0a-4dbe-b644-08db78b00f99
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[217.66.60.4];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR05FT039.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB2046
X-TM-AS-ERS: 104.47.7.174-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1011-27722.000
X-TMASE-Result: 10--13.217400-4.000000
X-TMASE-MatchedRID: xXA8JSLb31tKqT77NMMyNxZu3Ax5Ngq859KGlOljPvu4xpDSsMYz9Ik+
        ek903bmdJIE8B+MatXg0MlZvaRoxGC6T4pgCl/M6R6eMmpdkcdk6Cu19Vtgyg//cMgrTjbBkRQc
        XrCueZFhpO0BOxhTlbJA/ATZ0Yg5D0GDK5hZjJXyB7KF1cYE+v/emg0BhV6PFu5fROEbKeImvU1
        tCOC5lhTIs3LEAaA7XSE3uK2tLdI1NOAGUOSRGeF7YyKSX4fHjFQ/jDVQKXn4eyPVZe0RJiUkgG
        AfseSYI2agkMppXv0n2CX+DNSvaTpVqXn8k6sIeju2XlcEx9HQFgK3XHdr3w4loy91GB/ZEB0lB
        bq8327NXoinqR4tvX6Wz+FpE58Tnk/dA6P3T5Fuw0Dfrl0kL6wjIhAT2d4YVyEYRIXZC1hLpS1H
        JaayLrp6fQ44SVZDd6xA0Ava73nBHnLDmms99+BEuOqgkm3/1h7z+gmKKj0oDf6I8jFx+tgxKJh
        lMXnCqcYO7LzLWqS5krrVhD7Q0DkmcU+PbeIu4GrcQV6ODggA/FSuCUJL71oRUjoIe39qe
X-TMASE-XGENCLOUD: 63fc4136-7300-4884-b1b5-fe214e3d4904-0-0-200-0
X-TM-Deliver-Signature: E20E4B2E1F2FAFE8063F4F07ED9B9661
X-TM-Addin-Auth: VzlyViWVjvreRq2jAlTwoTktHB4Ho5ISkitaE0gRjobWlTcvBcoo7FvhCQp
        mVsk50NE5mQ3+HxUDNOTk1pKfopxjKVGMM8D1RuxoUxYePHY36dB9ztQeqLNiloSE98p0Jh/Zjo
        NsvI/waMsFTPSNlthdAoupefPv9Z0v1/f4/+7IC3czAvDnUzDk8vPzUEGEIY10AW4/oDkKqVf0q
        EnN7tjUBZCjkxf5cnPsdrf8N4Qik+JG0UbyLBf3PmM/46VNuHBF5baIN+XoxOi/TjbkeKu3meYT
        lEqCQJ7eOOKwrGAHzXYwHgWy5owzp5lE6Kia.t7kmS6ReXbQ3us1rnwxn9AffsQCChUxohIKm43
        LwVrB6EYZlfqhGKuYkACBR3mEnKGyaHZo8FqjacPojkifyNZsw+DjRRqpW0xZuvEMdM/nCWOf97
        alY759K5Z31JrC2hYG4HoHvUMirIEDdknuLzM9qhmnF1jJBiXO0fqn8dOKQZDxjR4wMnxr6bvYr
        FS1G3ThoVVM/AujSKXh+D7lj9T+FMrfSfnaU0gnWq9Wk0KBI0MZDbPexv6Z7vCKczITuBMguhxh
        f3lhmWmIii5opOSx87+IcwiLausIhaJmbuSQwAYumRf7QI8t84T1bR3XQt4IH/1dBhx2Fu5UVnw
        DqBQ==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
        s=TM-DKIM-20210503141657; t=1688050191;
        bh=0vYK3F+00qzY6tgYrDYn2jmyyaCVmzedj4Tjbgvevhw=; l=3149;
        h=From:To:Date;
        b=Ymn84sk52EWKJPWWXE3j/OJeeocbKwETMnMIoqNFqO6fqWp9/uYYbkQNYp58rexc0
         qbQqFl6hHDzjfI7XSdIZCnTDYXKODPy73krAY3d2piHVSWeV4r5SHVngyq4WkfmMZm
         q9eBkcCVkUt7x+yFf4ry+teuGojZAcfhE7eh7SwucOf2VO5rbz7+VRsIJS4JXnEmyi
         gZW8BUNrAb9d1rWip/Z1TY422pykWdyB0rHvJov1DfvQUuGHR+rbXSDMB9hwPddVPv
         4vFN4ys41owTVDd2IrBime44UBPHOZnNilQwTEx769nTEbftqwdvBw2evC59mwWgRC
         FrXUM2kmHwP9w==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This is the 8th version of virtio-video device patch. Feedback would be very
appreciated.

The main change coming with this draft is the introduction of background
operations and delayed responses to commands (the term is taken from the SCMI
spec) over eventq. Now most of the commands work like this. The only
exceptions are STREAM_CREATE and RESOURCE_ATTACH_BACKING commands. This should
help avoid commandq descriptors exhaustion. Also I introduced "in band" and
"out of band" handling of SET_PARAMS command. Out of band is the way how it
was done before i.e. the command is handled immediately after dequeuing from
commandq. In band means putting it into device's INPUT queue so that it can
be executed precisely after a certain input resource and before the next one.
These two changes allowed me to represent the events as a custom case of the
delayed responses. Also this enables processing resolution changes embedded in
the stream and coming from outside in the same way. I think this makes it
possible to implement V4L2 Requests API.

Questions for discussion/roadmap:
1. It looks like the current way of describing the device capabilities is not
very well extendable. I'd like to change it again. The goal is that after
adding new generic parameters/new codecs/new codec parameters and covering
them with the feature flags the format of the device response doesn't depend
that much on the enabled flags. My current idea is to convert this into a
serie of descriptors with offsets and sizes, so that the device can then
simply adjust offsets and sizes, but keep that layout the same. Any ideas here
would be appreciated.
2. Since draft v7 the device is expected to provide all and every one of its
capabilities as a response to the DEVICE_QUERY_CAPS command. Maybe the device
shouldn't adjust the parameters itself now?
3. I think the last piece, that is missing completely, is QoS. How can the
device indicate to the driver, that it is saturated? How could the device be
shared between multiple guests in a fair way?

Full PDF: https://drive.google.com/file/d/1uPg4kxThlNPBSiC4b5veyFz4OFGytU7v/view?usp=sharing
PDF with the video section only: https://drive.google.com/file/d/1iW3MbseRZLovlxpc4XAF8VTvhQ_Tww6q/view?usp=sharing

Changelog v7 -> v8:
* Added the delayed responses to commands sent on the eventq.
* Added the in band STREAM_SET_PARAMS command handling.
* Implemented device events using the newly added delayed responses.

Alexander Gordeev (1):
  virtio-video: Add virtio video device specification

 conformance.tex                           |    4 +
 content.tex                               |    1 +
 device-types/video/description.tex        | 2040 +++++++++++++++++++++
 device-types/video/device-conformance.tex |   22 +
 device-types/video/driver-conformance.tex |   16 +
 introduction.tex                          |   21 +
 6 files changed, 2104 insertions(+)
 create mode 100644 device-types/video/description.tex
 create mode 100644 device-types/video/device-conformance.tex
 create mode 100644 device-types/video/driver-conformance.tex

-- 
2.34.1

