Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E42D6742927
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 17:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbjF2PLP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jun 2023 11:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbjF2PLO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jun 2023 11:11:14 -0400
Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 238A830E6
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 08:11:09 -0700 (PDT)
Received: from 104.47.7.175_.trendmicro.com (unknown [172.21.9.43])
        by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id 544AC109B4411
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 14:49:49 +0000 (UTC)
Received: from 104.47.7.175_.trendmicro.com (unknown [172.21.201.179])
        by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 8BAF410000E14;
        Thu, 29 Jun 2023 14:49:47 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1688050186.284000
X-TM-MAIL-UUID: 67ba779a-7ef0-4973-ab45-034f566b2728
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.175])
        by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 4593510004D80;
        Thu, 29 Jun 2023 14:49:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIO/vaBj7K8S1eGsr8D0zEuznmiaAUAClkp8d87f2LqZjMkZE1gjMTfyGlmuE2+HdDq196VFBPj/esrmMTlZKp3o+1wEf3YinBqxsBRJ7+gKqix2ho7QzlAU0lj93p++l8SwX6loiO7Re61B/3+Snw0bmKnQTVPKdTYKSVRHjZV+xMmtq/yR2LdwxEAANF59HDoYHUZ7Ar5gS61Hugmd8mudCEVmdY77osOw//A0pNCc47dYkxr8EEpglcFD1aJycUglkM/6Ghs+YBC89MezjI3URYsTUd93U01kvnmj4Ce4o+rVSFsTMN/0bkQsp4v4DQsM1PwPjlpE8zQqG583cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vm6xbAoQPsIrgmO78jjuAW5OKo56mVRoA3eMUKX8pKk=;
 b=BHmgsSVHbXsiS0efCDAp+CvDHf5tYHRQCHxe1suEh54f0Uiln3Gho8LXdS/ZLakLh+0MPFvS2IBUWomfR45vKBiGFzPnvgLBFOwJfIxYHVQK4bdT/58ejWm9sgtLC9jQTB5zgghFpIPQfwMpPpApSh9gB5HDAjGjfLkbtBkFEe4mjPLBQYR0a5tDpFVqemWEApRrtOOxVxV+8d8GYIwYbqtAsOHBLDfYTHwvMxjRGIE37WViOQmgKeVy5/xA0O5BLV1OEI9dDkHp4lxAESws5iQXEQez6ZWWDTA2jzMTLv4h5o/5dnUQy0AlJJ8YUXoIXRut1Kn237M7IYRcShRCzw==
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
Subject: [RFC PATCH v8 1/1] virtio-video: Add virtio video device specification
Date:   Thu, 29 Jun 2023 16:49:15 +0200
Message-Id: <20230629144915.597188-2-Alexander.Gordeev@opensynergy.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230629144915.597188-1-Alexander.Gordeev@opensynergy.com>
References: <20230629144915.597188-1-Alexander.Gordeev@opensynergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1EUR05FT045:EE_|FRYP281MB2505:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f2ca3bd2-17d0-4427-3cfd-08db78b01298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +2myTRgzn/DRiJ29wUjs4ubBr+reZx5xL/T1gBiAWhjJ2+7edImsRKjCPOyNwq1BPN6IoS1DYpVYU7oODsYWBzmClYKCFeLExvYGLEsigVmwcMrAdsZO7tn69V2nPhRd8RvkexQosT9r8iCIsqjlZz+BSJufylvHSQBp8ZZaFt5H1kwSU1Ga0lEXU09Drt0Pb+jmrDC3PjAoiKrMzREPGH42/t+PV9IzOLH2o2ZucFb4XC55ry3PcvWAkfxyXrFQcs+FvwMctbxYx/vdPu2xpjcPkc4EIFoR2d8tnLk0XEC3m0c8TyTsStylrD3Om4fq4YkLLeOSwU9G+25lTDezoop7f3KDAzw6XAqSS1Vvjm7CevJY7VpI3vSnrjDQTOFT1rLnrE4mgBryQN2MsR20tfxoPEKhG6LYdVryhctcD0DGay1lF8ry2CSwOqYhilqCkI6fx+WUDUREphHfvXZDhVuTnX4XFPfih/I6s76jskTi/CJBKKNIlWbuPB4HsW/akZPA1saO244uGZOHMx4a2C8n9iUJlsZ+LpWl8vU1LfQdZB1gQd+v5anBS+W3sh/j1jRXb/BD53CzQQDCOSXzndRpnz4hhLVY5BOgji9unPdDMWj1X98A8F3qRw0TG9ZUMco0BG9RwHO3MBn7+iAakXTEvx4SWIx2QBEZjI0Ri4b7I6ygjAWsk5S7QUKpXpHkHf9YSor+IsLO1BbWeTnEy+npjc1WnzRnQe76xbviF/TXEvVSS9hoNS7v/Fo5uewR834Vtk/+eJB+TWsvDFDt6Q==
X-Forefront-Antispam-Report: CIP:217.66.60.4;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(39840400004)(396003)(346002)(136003)(376002)(451199021)(36840700001)(46966006)(26005)(82310400005)(4326008)(36860700001)(8936002)(36756003)(2616005)(478600001)(1076003)(42186006)(336012)(54906003)(186003)(2906002)(83380400001)(70206006)(7416002)(47076005)(40480700001)(81166007)(30864003)(5660300002)(70586007)(86362001)(8676002)(316002)(41300700001)(36900700001)(559001)(579004);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 14:49:42.3663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ca3bd2-17d0-4427-3cfd-08db78b01298
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[217.66.60.4];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR05FT045.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB2505
X-TM-AS-ERS: 104.47.7.175-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1011-27722.000
X-TMASE-Result: 10--44.068100-4.000000
X-TMASE-MatchedRID: 29kHMs2vf06UP+0hdpOx0icOunEIf0eXTY6J9vkpk6+EnIovOLzQ+rHq
        N6eNokKxnQvVnz410DyLO9h/kZ7mQnkHMxUIdlxL+DE5zr5ahdzc7b6k5+X69zAsn09lQFCFm7W
        YZnTau36ijVoxG5GMcAfoZhqt/FSE2J61hi7qqbLWcxHsnT13T+A4l73CwysLkZ43711Uirfnq/
        Q0Vm6yzXjkOsl2UmOSiOO4tRkG+50b0MvbS2k7/SHbUYHbu3LPFST1Kl560HX3cndh37T/SWkZM
        d34UMmmHVL/xxFlcltDINA8M9Ne0U2x0FxidoSmemm/1TaRdd3PpNF1bfHUnMgRXD+03JOE6nse
        NNR95gbeUtu7e4i/MP0c497MJh22inAJQ2S8fPTU0ho7mxaK+EhlNcVMkCtB510322JqPPF2Hgl
        epQYR/W2J/qwPCeB5W214Tu6s6eS3Pvji3GoaojGcfhF8jWqlUCpvN72sC4R5omhgu+tgnMz6kc
        LfmLH3r8zCvZgwym6WVFu85nRfAUJaLSnVzhpREJb5gExl9kglvNm7AvH7hYvXantxmoFYVvBNm
        pZsnvlHngKZrA8SBaEXOzL3efiA0ViwfaeIJ4KheJ4X7s7Smid8voqopKNvlueiTveeZGBse4/F
        hkHD/oWDRBq0nZN4umYnNOnJWHt5R4388c4pswh6+YU9lqNBET56SaIP1M+m5Tj2KN9Ra0Vts87
        AfIN/Z4mX9LDz21dRZsCH1yqIuaGHUXYlpMs0s8RQjMiI1+dvhljR6nu+BLUZmn0aeRTzgLSnwL
        6izcygrS5V6+bXIU4neQgXlTIqgJ1EY96rSXwRLjqoJJt/9Ye8/oJiio9KA3+iPIxcfrYMSiYZT
        F5wqnGDuy8y1qkuImxnQvgkai0i4mJ41W/O+n7cGd19dSFd
X-TM-Deliver-Signature: CF01657AA1081B49FF34430C112864C2
X-TM-Addin-Auth: cKncH1VmxLBk1dbuUQjWfXkE472IXuvd+1bRf4lqi4Z6cRxwiZVW0d9W330
        KFXJXewxHgf4Xij+QaxFJyMzj861NX7bh3ImlPdDg65OiG4iS19amJxJRb3pIQY71VJUUSpXGac
        G/cJGzDGRE/NA5P3VECPWse15do9J0f0/3hz9DpInl2VlPQzk0nBEFST+xq6md9bZn+lO2Aet0N
        4ttgef1tE5jZfvAKegWMrRWJ0PDn/EjBcYC3JonWqmGO3guEVGOtBVnybepOKqAcJaMArHuoGEp
        XcCrSgO3UYWf5qHx0HdEjD6YToz7CxcN1N0X.MDZjze4FW3TZooMs8FcBgfHU22hKLr5kbIRdS/
        ukCuVIrREO3KGHbcplgU5vsatewkGT+ERTa54vQ3vl1FA4SfQvHsDo0hctq5TI73KkxE3z1S44Z
        eLYzj5Rgiw1u2fRWgftRw2fahzp84STCbYjw2vyxFj68hsvgGyTyENZ8rdew93Fmhk3WdVFQVc0
        1gA9OlK0M84q4J7jqk2oBFTTzAX09JHiXQpyiDi11tw0gaFCrRlhIBOL2X4WstlNutvGEJW8/cu
        QLyz5olGSzieCOPVrTaOAX0j6C7GRquok+VzUE26mVDcFq0zcUiZocnzw/I4fq5bZeXE+ATx83L
        SUSA==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
        s=TM-DKIM-20210503141657; t=1688050187;
        bh=D7Rk5CPHC6SCtmLGjQeTQ0rUx65h3IJv6uG5Wzg72JM=; l=98722;
        h=From:To:Date;
        b=vjKA2nZseqXdae8d91MTGb2AbE8OtHD8lYuIiaO2/lTeYIltUg2sazFtVVqwmJpvV
         /bluHy1tOu2PjkCqTMG4c3wQlNs4j1jMszkgTggGaOSTVtCVOjfMBh408iTdtS7DtE
         tZWiKQRbCMQ2/mjrTsuintipx45WtA9IWCOUMrCVDp/REmHA3NyL/OVdCgWd5ocxFo
         tJ15Yn8pmKpxi0C2/0FE8aM6uH014ShmnVNC84RdmEuLIEoA26MhADYlJYATnyNQUZ
         rdrqUGazwDIh3B+Ti0ltJiXluIXh1OrIA6n6Y9QDW6dwH6mjkjnuKe9T59NNRm3zg4
         b9XSbc0bd1Uyw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the specification of the video decoder and encoder devices, which
can be used to provide host-accelerated video operations to the guest.

Signed-off-by: Alexander Gordeev <Alexander.Gordeev@opensynergy.com>
Co-authored-by: Keiichi Watanabe <keiichiw@chromium.org>
Co-authored-by: Alexandre Courbot <acourbot@chromium.org>
---
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

diff --git a/conformance.tex b/conformance.tex
index 01ccd69..d719eda 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -34,6 +34,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance} or
 \ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance}.
+\ref{sec:Conformance / Driver Conformance / Video Driver Conformance},
 
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
   \end{itemize}
@@ -61,6 +62,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \ref{sec:Conformance / Device Conformance / SCMI Device Conformance},
 \ref{sec:Conformance / Device Conformance / GPIO Device Conformance} or
 \ref{sec:Conformance / Device Conformance / PMEM Device Conformance}.
+\ref{sec:Conformance / Device Conformance / Video Device Conformance},
 
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
   \end{itemize}
@@ -152,6 +154,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/scmi/driver-conformance.tex}
 \input{device-types/gpio/driver-conformance.tex}
 \input{device-types/pmem/driver-conformance.tex}
+\input{device-types/video/driver-conformance.tex}
 
 \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
 
@@ -238,6 +241,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/scmi/device-conformance.tex}
 \input{device-types/gpio/device-conformance.tex}
 \input{device-types/pmem/device-conformance.tex}
+\input{device-types/video/device-conformance.tex}
 
 \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
 A conformant implementation MUST be either transitional or
diff --git a/content.tex b/content.tex
index d2ab9eb..90708d7 100644
--- a/content.tex
+++ b/content.tex
@@ -765,6 +765,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \input{device-types/scmi/description.tex}
 \input{device-types/gpio/description.tex}
 \input{device-types/pmem/description.tex}
+\input{device-types/video/description.tex}
 
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
diff --git a/device-types/video/description.tex b/device-types/video/description.tex
new file mode 100644
index 0000000..760df7f
--- /dev/null
+++ b/device-types/video/description.tex
@@ -0,0 +1,2040 @@
+\section{Video Device}
+\label{sec:Device Types / Video Device}
+
+The virtio video encoder and decoder devices provide support for
+host-accelerated video encoding and decoding. Despite being different
+device types, they use the same protocol and general flow.
+
+\subsection{Device ID}
+\label{sec:Device Types / Video Device / Device ID}
+
+\begin{description}
+\item[30]
+  encoder device
+\item[31]
+  decoder device
+\end{description}
+
+\subsection{Virtqueues}
+\label{sec:Device Types / Video Device / Virtqueues}
+
+\begin{description}
+\item[0]
+  commandq - queue for driver commands and device responses to these commands
+\item[1]
+  eventq - queue for device delayed responses to commands and standalone
+  device events
+\end{description}
+
+\subsection{Feature bits}
+\label{sec:Device Types / Video Device / Feature bits}
+
+\begin{description}
+\item[VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES (0)]
+  Guest pages can be used as the backing memory of resources.
+\item[VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG (1)]
+  The device can use non-contiguous guest memory as the backing memory of
+  resources. Only meaningful if VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES is also
+  set.
+\item[VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT (2)]
+  Objects exported by another virtio device can be used as the backing memory
+  of resources.
+\item[VIRTIO_VIDEO_F_RESOURCE_DYNAMIC (3)]
+  The device supports re-attaching memory to resources while streaming.
+% TODO this flag is not used anywhere at the moment.
+% Might be necessary with Android.
+\end{description}
+
+\devicenormative{\subsubsection}{Feature bits}{Device Types / Video Device / Feature bits}
+
+The device MUST set at least one of VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES or
+VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT, since the absence of both bits would
+mean that no memory can be used at all for resources.
+
+The device MUST NOT set VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG unless it also sets
+VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES.
+
+\drivernormative{\subsubsection}{Feature bits}{Device Types / Video Device / Feature bits}
+
+The driver MUST negotiate at least one of the
+VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES and VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT
+features.
+
+If VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES has been negotiated, but not
+VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG, the driver MUST use physically
+contiguous memory for all the buffers it allocates.
+
+\subsection{Device configuration layout}
+\label{sec:Device Types / Video Device / Device configuration layout}
+
+The video device configuration space uses the following layout:
+
+\begin{lstlisting}
+struct virtio_video_config {
+        le32 caps_length;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{caps_length}]
+  is the minimum length in bytes that a device-writable buffer must have
+  in order to receive the response to VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS, see
+  \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}.
+\end{description}
+
+\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Video Device / Device configuration layout}
+
+The device MUST set the \field{caps_length} field to a value equal to
+the response size of VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS.
+
+\subsection{Supported parameters}
+\label{sec:Device Types / Video Device / Supported parameters}
+
+\subsubsection{Supported coded formats}
+\label{sec:Device Types / Video Device / Supported parameters / Supported coded formats}
+
+The following coded formats are defined:
+\begin{lstlisting}
+#define VIRTIO_VIDEO_CODED_FORMAT_MPEG2  1  /* MPEG-2 Part 2  (V4L2_PIX_FMT_MPEG2) */
+#define VIRTIO_VIDEO_CODED_FORMAT_MPEG4  2  /* MPEG-4 Part 2  (V4L2_PIX_FMT_MPEG4) */
+#define VIRTIO_VIDEO_CODED_FORMAT_H264   3  /* H.264          (V4L2_PIX_FMT_H264)  */
+#define VIRTIO_VIDEO_CODED_FORMAT_HEVC   4  /* HEVC aka H.265 (V4L2_PIX_FMT_HEVC)  */
+#define VIRTIO_VIDEO_CODED_FORMAT_VP8    5  /* VP8            (V4L2_PIX_FMT_VP8)   */
+#define VIRTIO_VIDEO_CODED_FORMAT_VP9    6  /* VP9            (V4L2_PIX_FMT_VP9)   */
+\end{lstlisting}
+
+The above constants have two usages:
+\begin{enumerate}
+\item As bit numbers, used to tell the driver which coded formats are
+supported by the device, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}.
+\item As values, used to designate the coded format when working with
+stream parameters, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}.
+\end{enumerate}
+
+The coded formats and the expected data units per buffer are documented in
+\hyperref[intro:V4L2]{V4L2 header} and
+\hyperref[intro:V4L2 compressed]{V4L2 compressed formats documentation}.
+
+\subsubsection{Supported raw formats}
+\label{sec:Device Types / Video Device / Supported parameters / Supported raw formats}
+
+The following raw formats are defined:
+\begin{lstlisting}
+#define VIRTIO_VIDEO_RAW_FORMAT_ARGB8888  1  /* DRM_FORMAT_ARGB8888 / V4L2_PIX_FMT_ABGR32 */
+#define VIRTIO_VIDEO_RAW_FORMAT_BGRA8888  2  /* DRM_FORMAT_BGRA8888 / V4L2_PIX_FMT_ARGB32 */
+#define VIRTIO_VIDEO_RAW_FORMAT_RGBA8888  3  /* DRM_FORMAT_RGBA8888 / V4L2_PIX_FMT_BGRA32 */
+#define VIRTIO_VIDEO_RAW_FORMAT_NV12      4  /* DRM_FORMAT_NV12     / V4L2_PIX_FMT_NV12   */
+#define VIRTIO_VIDEO_RAW_FORMAT_YUV420    5  /* DRM_FORMAT_YUV420   / V4L2_PIX_FMT_YUV420 */
+#define VIRTIO_VIDEO_RAW_FORMAT_YVU420    6  /* DRM_FORMAT_YVU420   / V4L2_PIX_FMT_YVU420 */
+#define VIRTIO_VIDEO_RAW_FORMAT_YUYV      7  /* DRM_FORMAT_YUYV     / V4L2_PIX_FMT_YUYV   */
+\end{lstlisting}
+
+The above constants have two usages:
+\begin{enumerate}
+\item As bit numbers, used to tell the driver which raw formats are
+supported by the device, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}.
+\item As values, used to designate the raw format when working with
+stream parameters, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}.
+\end{enumerate}
+
+The layouts of raw formats are documented in \hyperref[intro:DRM formats]{DRM}
+and \hyperref[intro:V4L2]{V4L2} headers, as well as in
+\hyperref[intro:V4L2 RGB]{V4L2 RGB} and
+\hyperref[intro:V4L2 YUV]{planar YUV} formats documentation.
+
+\subsubsection{Supported stream parameters}
+\label{sec:Device Types / Video Device / Supported parameters / Supported stream parameters}
+
+The following stream parameters are defined:
+\begin{lstlisting}
+#define VIRTIO_VIDEO_PARAM_CODED_FORMAT       1
+#define VIRTIO_VIDEO_PARAM_RAW_FORMAT         2
+#define VIRTIO_VIDEO_PARAM_CODED_RESOURCES    3
+#define VIRTIO_VIDEO_PARAM_RAW_RESOURCES      4
+#define VIRTIO_VIDEO_PARAM_CROP               5
+#define VIRTIO_VIDEO_PARAM_BITRATE            6  /* Same as V4L2_CID_MPEG_VIDEO_BITRATE */
+#define VIRTIO_VIDEO_PARAM_GROUP_CODEC_MPEG2  7
+#define VIRTIO_VIDEO_PARAM_GROUP_CODEC_MPEG4  8
+#define VIRTIO_VIDEO_PARAM_GROUP_CODEC_H264   9
+#define VIRTIO_VIDEO_PARAM_GROUP_CODEC_HEVC   10
+#define VIRTIO_VIDEO_PARAM_GROUP_CODEC_VP8    11
+#define VIRTIO_VIDEO_PARAM_GROUP_CODEC_VP9    12
+\end{lstlisting}
+% TODO acourbot: See b/241492607 (fractional frame rates??)
+
+The above constants have two usages:
+\begin{enumerate}
+\item As bit numbers, used to tell the driver which stream parameters are
+supported by the device, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}.
+\item As values, used to designate the stream parameters when working with
+them, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}.
+\end{enumerate}
+
+\subsection{Device Initialization}
+\label{sec:Device Types / Video Device / Device Initialization}
+
+\begin{enumerate}
+\def\labelenumi{\arabic{enumi}.}
+\item
+  The driver reads the feature bits and negotiates the features it needs.
+\item
+  The driver sets up the commandq and the eventq.
+\item
+  The driver reads the \field{caps_length} field of the configuration
+  space and prepares a buffer of at least that size.
+\item
+  The driver sends that buffer on the commandq with the
+  VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS command.
+\item
+  The driver receives the response from the device, and parses its capabilities.
+\end{enumerate}
+
+\subsection{Device Operation}
+\label{sec:Device Types / Video Device / Device Operation}
+
+The commandq is used by the driver to send commands to the device and to
+receive the device's responses via used buffers. The eventq is used by the
+device to send the device's delayed responses to commands and standalone
+device events.
+
+The driver can create new streams using the
+VIRTIO_VIDEO_CMD_STREAM_CREATE command. Each stream has two resource
+queues (not to be confused with the virtio queues) called INPUT and
+OUTPUT, when the direction of the data flow matters. The INPUT queue accepts
+driver-filled input data for the device (coded data for a decoder;
+input frames for an encoder), while the OUTPUT queue receives resources to be
+filled by the device as a result of processing the INPUT queue (decoded raw
+frames for a decoder; encoded data for an encoder).
+
+These same queues can be also called CODED and RAW, when their content matters.
+The CODED queue is used to transfer compressed video data (INPUT for a decoder;
+OUTPUT for an encoder), while the RAW queue is used to transfer raw frames
+(OUTPUT for a decoder; INPUT for an encoder).
+
+The INPUT and OUTPUT queues are effectively independent, and the driver
+can fill them without caring about the other queue. In particular there
+is no need to queue input and output resources in pairs: one input
+resource can result in zero to many produced output resources.
+
+A resource is a set of memory buffers that contain a unit of data that
+the device can process or produce. Most resources will only have one
+buffer (like coded data and single-planar raw frames), but frames using a
+multi-planar format can have several.
+
+Parameters allow the driver to configure the stream for the decoding or
+encoding operation. The parameters can be obtained and configured using
+VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS. Available parameters depend on
+the device type and are detailed in section
+\ref{sec:Device Types / Video Device / Supported parameters / Supported stream parameters}.
+
+Before resources can be submitted to a queue, backing memory must be
+attached to them using VIRTIO_VIDEO_CMD_RESOURCE_ATTACH_BACKING.
+The exact form of that memory is negotiated using the feature flags.
+
+In the case of a decoder device, the decoded frames are made available
+on the OUTPUT queue in presentation order.
+
+Resources are queued to the INPUT or OUTPUT queue using the
+VIRTIO_VIDEO_CMD_RESOURCE_QUEUE command. The device sends a delayed response
+to this command when an input resource has been fully processed and can be
+reused by the driver, or when an output resource has been filled by the
+device as a result of processing.
+
+The device can detect stream-related events that require intervention
+from the driver and signals them on the eventq, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}.
+One example is a dynamic parameters change while decoding a stream, which
+may require the driver to reallocate the backing memory of its output
+resources to fit the new resolution.
+
+% RESET and DRAIN have essentially the same outcome: all the input
+% resources queued before the command are released, there are no related
+% output resources in the decoder/encoder, the dequeued output resources
+% can't be used as a reference by the device. So the other requirements should
+% be reasonably similar.
+% Use-case: playback in a loop from second 1 till the end of file.
+
+% TODO put some examples in the comments
+
+\subsubsection{Device Operation: Command Virtqueue}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueue}
+
+This section details the commands that can be sent on the commandq by
+the driver, as well as the responses that the device will write.
+
+Different structures are used for each command and response. A command
+structure starts with the requested command code, defined as follows:
+
+\begin{lstlisting}
+/* Device */
+#define VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS       0x100
+
+/* Stream */
+#define VIRTIO_VIDEO_CMD_STREAM_CREATE           0x200
+#define VIRTIO_VIDEO_CMD_STREAM_DESTROY          0x201
+#define VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS       0x202
+#define VIRTIO_VIDEO_CMD_STREAM_DRAIN            0x203
+#define VIRTIO_VIDEO_CMD_STREAM_RESET            0x204
+
+/* Resource */
+#define VIRTIO_VIDEO_CMD_RESOURCE_ATTACH_BACKING 0x300
+#define VIRTIO_VIDEO_CMD_RESOURCE_QUEUE          0x301
+\end{lstlisting}
+
+A response structure starts with the result of the requested command,
+defined as follows:
+
+\begin{lstlisting}
+/* Success */
+#define VIRTIO_VIDEO_RESULT_OK                          0x000
+#define VIRTIO_VIDEO_RESULT_OK_DELAYED                  0x001
+
+/* Error */
+#define VIRTIO_VIDEO_RESULT_ERR_INVALID_COMMAND         0x100
+#define VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION       0x101
+#define VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID       0x102
+#define VIRTIO_VIDEO_RESULT_ERR_INVALID_RESOURCE_ID     0x103
+#define VIRTIO_VIDEO_RESULT_ERR_INVALID_ARGUMENT        0x104
+#define VIRTIO_VIDEO_RESULT_ERR_OUT_OF_MEMORY           0x105
+\end{lstlisting}
+
+For response structures carrying an error code, the rest of the
+structure is considered invalid.
+
+For all commands beginning background operations and returning delayed
+responses over eventq, the command response is defined as follows:
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_INVALID_RESPONSE_ID  0xffffffff
+
+struct virtio_video_command_resp_delayed_common {
+        le32 result; /* VIRTIO_VIDEO_RESULT_* */
+        le32 delayed_response_id;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{result}]
+  is
+
+  \begin{description}
+  \item[VIRTIO_VIDEO_RESULT_OK_DELAYED]
+    if the command started the desired background operation successfully,
+  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID]
+    if the mentioned stream ID does not exist,
+  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_RESOURCE_ID]
+    if the mentioned resource ID does not exist,
+  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_ARGUMENT]
+    if other command parameters are not valid, e.g. not within the device's
+    capabilities,
+  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION]
+    if the command is performed at a time when it is not valid.
+  \end{description}
+\item[\field{delayed_response_id}]
+  is an ID of the future delayed response provided by the device, that allows
+  to relate it to the command.
+\end{description}
+
+\devicenormative{\paragraph}{Device Operation: Command Virtqueue}{Device Types / Video Device / Device Operation / Device Operation: Command Virtqueue}
+
+Responses to a command MUST be written by the device in the first
+device-writable descriptor of the descriptor chain from which the
+command came.
+
+The device MUST return VIRTIO_VIDEO_RESULT_ERR_INVALID_COMMAND to
+any command code it does not recognize.
+
+\field{delayed_response_id} MUST be set to a stream-unique identifier that
+remains valid as long as the background operation hasn't finished.
+
+\drivernormative{\paragraph}{Device Operation: Command Virtqueue}{Device Types / Video Device / Device Operation / Device Operation: Command Virtqueue}
+
+Descriptor chains sent to the commandq by the driver MUST include at
+least one device-writable descriptor of a size sufficient to receive the
+response to the queued command.
+
+The driver MUST NOT interpret the rest of a response whose result is not
+VIRTIO_VIDEO_RESULT_OK or VIRTIO_VIDEO_RESULT_OK_DELAYED.
+
+\subsubsection{Device Operation: Event Virtqueue}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}
+
+The eventq is used by the device to send delayed responses to commands queued
+by the driver on the commandq and standalone events. Stream errors and dynamic
+parameters changes are caused by changes in the device's state, not by
+commands, still they are delivered as VIRTIO_VIDEO_DELAYED_RESP_STREAM_DESTROY
+and VIRTIO_VIDEO_DELAYED_RESP_STREAM_SET_PARAMS, respectively.
+
+The supported events are defined as follows:
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_DELAYED_RESP_STREAM_DESTROY     1
+#define VIRTIO_VIDEO_DELAYED_RESP_STREAM_SET_PARAMS  2
+#define VIRTIO_VIDEO_DELAYED_RESP_STREAM_DRAIN       3
+#define VIRTIO_VIDEO_DELAYED_RESP_STREAM_RESET       4
+#define VIRTIO_VIDEO_DELAYED_RESP_RESOURCE_QUEUE     5
+
+#define VIRTIO_VIDEO_EVENT_FLAG_CANCELED             (1 << 0)
+
+struct virtio_video_event {
+        le32 event_type; /* VIRTIO_VIDEO_DELAYED_RESP_* */
+        le32 stream_id;
+        le32 delayed_response_id;
+        le32 event_flags; /* Bitmask of VIRTIO_VIDEO_EVENT_FLAG_* */
+        union {
+                struct virtio_video_stream_set_params_delayed_resp set_params;
+                struct virtio_video_resource_queue_delayed_resp queue;
+        };
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{event_type}]
+  is the type of the event.
+\item[\field{stream_id}]
+  is the ID of a valid stream.
+\item[\field{delayed_response_id}]
+  is an ID of the delayed response, that allows to relate it to a previously
+  submitted command. If it is set to VIRTIO_VIDEO_INVALID_RESPONSE_ID, then
+  this is a standalone event, see
+  \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}.
+\item[\field{event_flags}]
+  is a bitmask of VIRTIO_VIDEO_EVENT_FLAG_* flags
+
+  \begin{description}
+  \item[VIRTIO_VIDEO_EVENT_FLAG_CANCELED]
+    is set if the command has been canceled by another command, that has
+    higher priority. Doesn't make sense for standalone events.
+  \end{description}
+\end{description}
+
+The particular member of the union is selected according to the
+\field{event_type} for some of the types.
+
+\drivernormative{\paragraph}{Device Operation: Event Virtqueue}{Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}
+
+The driver MUST at any time have at least one descriptor with a used
+buffer large enough to contain a \field{struct virtio_video_event}
+queued on the eventq.
+
+The driver MUST NOT put device-readable descriptors into the eventq.
+
+\subsubsection{Device Operation: Device Commands}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands}
+
+This command allows retrieving the device capabilities.
+
+\paragraph{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}
+
+Retrieve device capabilities for all available stream parameters.
+
+The driver sends this command with
+\field{struct virtio_video_device_query_caps}:
+
+\begin{lstlisting}
+struct virtio_video_device_query_caps {
+        le32 cmd_type; /* VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS */
+};
+\end{lstlisting}
+
+The device responds with
+\field{struct virtio_video_device_query_caps_resp}:
+
+\begin{lstlisting}
+#define MASK(x) (1 << (x))
+
+struct virtio_video_device_query_caps_resp {
+        le32 result; /* VIRTIO_VIDEO_RESULT_* */
+        le32 stream_params_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_PARAM_*) */
+        le32 coded_formats_bitmask; /* Bitmaks of MASK(VIRTIO_VIDEO_CODED_FORMAT_*) */
+        le32 raw_formats_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_RAW_FORMAT_*) */
+        le32 num_format_deps;
+        le32 num_raw_format_caps;
+        le32 num_coded_resources_caps;
+        le32 num_raw_resources_caps;
+        le32 num_bitrate_caps; /* If MASK(VIRTIO_VIDEO_PARAM_BITRATE) is set. */
+        u8 padding[4];
+        /* If corresponding MASK(VIRTIO_VIDEO_PARAM_GROUP_CODEC_*) is set. */
+        struct virtio_video_mpeg2_caps mpeg2_caps;
+        struct virtio_video_mpeg4_caps mpeg4_caps;
+        struct virtio_video_h264_caps h264_caps;
+        struct virtio_video_hevc_caps hevc_caps;
+        struct virtio_video_vp8_caps vp8_caps;
+        struct virtio_video_vp9_caps vp9_caps;
+        /**
+         * Followed by
+         * struct virtio_video_format_dependency format_deps[num_format_deps];
+         */
+        /**
+         * Followed by
+         * struct virtio_video_raw_format_caps raw_format_caps[num_raw_format_caps];
+         */
+        /**
+         * Followed by
+         * struct virtio_video_coded_resources_caps
+         * coded_resources_caps[num_coded_resources_caps];
+         */
+        /**
+         * Followed by
+         * struct virtio_video_raw_resources_caps raw_resources_caps[num_raw_resources_caps];
+         */
+        /**
+         * Followed by if MASK(VIRTIO_VIDEO_PARAM_BITRATE) is set
+         * struct virtio_video_bitrate_caps bitrate_caps[num_bitrate_caps];
+         */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{result}]
+  is
+
+  \begin{description}
+  \item[VIRTIO_VIDEO_RESULT_OK]
+    if the operation succeeded,
+  \item[VIRTIO_VIDEO_RESULT_ERR_OUT_OF_MEMORY]
+    if the descriptor was smaller than the defined \field{caps_length} in
+    the video device configuration.
+  \end{description}
+\item[\field{stream_params_bitmask}]
+  is a bitmask of supported stream parameters.
+\item[\field{coded_formats_bitmask}]
+  is a bitmask of supported coded formats.
+\item[\field{raw_formats_bitmask}]
+  is a bitmask of supported raw formats.
+\item[\field{num_format_deps}]
+  is the number of elements in the format_deps array.
+\item[\field{num_raw_format_caps}]
+  is the number of elements in the raw_format_caps array.
+\item[\field{num_coded_resources_caps}]
+  is the number of elements in the coded_resources_caps array.
+\item[\field{num_raw_resources_caps}]
+  is the number of elements in the raw_resources_caps array.
+\item[\field{num_bitrate_caps}]
+  is the number of elements in the bitrate_caps array.
+\item[\field{mpeg2_caps}]
+  groups the capabilities of MPEG2 specific parameters.
+\item[\field{mpeg4_caps}]
+  groups the capabilities of MPEG4 specific parameters.
+\item[\field{h264_caps}]
+  groups the capabilities of H.264 specific parameters.
+\item[\field{hevc_caps}]
+  groups the capabilities of HEVC specific parameters.
+\item[\field{vp8_caps}]
+  groups the capabilities of VP8 specific parameters.
+\item[\field{vp9_caps}]
+  groups the capabilities of VP9 specific parameters.
+\item[\field{format_deps}]
+  is an array of size \field{num_format_deps} establishing dependencies
+  between coded and raw formats.
+\item[\field{raw_format_caps}]
+  is an array of size \field{num_raw_format_caps} containing the supported
+  raw formats capabilities.
+\item[\field{coded_resources_caps}]
+  is an array of size \field{num_coded_resources_caps}, that sets bounds for
+  the number of resources in the CODED queue.
+\item[\field{raw_resources_caps}]
+  is an array of size \field{num_raw_resources_caps}, that sets bounds for
+  the number of resources in the RAW queue.
+\item[\field{bitrate_caps}]
+  is an array of size \field{num_bitrate_caps} containing the supported
+  bitrates.
+\end{description}
+
+% TODO: V4L2 flow: 1. coded format without variants (maybe these flags
+% are relevant too: V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM?,
+% V4L2_FMT_FLAG_DYN_RESOLUTION?, V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL???),
+% also include variants (see VIDIOC_QUERYCTRL), then raw formats,
+% then resolutions (discrete or stepwise, see VIDIOC_ENUM_FRAMESIZES),
+% intervals are optional (see VIDIOC_ENUM_FRAMEINTERVALS)
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}{Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}
+
+The device MUST support at least these parameters:
+VIRTIO_VIDEO_PARAM_CODED_FORMAT, VIRTIO_VIDEO_PARAM_RAW_FORMAT,
+VIRTIO_VIDEO_PARAM_CODED_RESOURCES, VIRTIO_VIDEO_PARAM_RAW_RESOURCES.
+
+The device MUST NOT mark codec-specific parameters
+(VIRTIO_VIDEO_PARAM_GROUP_CODEC_*) as supported unless the corresponding
+codecs are supported as well.
+
+The device MUST set to zero all fields with capabilities of unsupported
+parameters.
+
+The lengths \field{num_format_deps}, \field{num_raw_format_caps},
+\field{num_coded_resources_caps} and \field{num_raw_resources_caps} MUST be
+positive.
+
+The device MUST write the five \field{format_deps},
+\field{raw_format_caps}, \field{coded_resources_caps},
+\field{raw_resources_caps} and \field{bitrate_caps} arrays, of length
+\field{num_format_deps}, \field{num_raw_format_caps},
+\field{num_coded_resources_caps}, \field{num_raw_resources_caps} and
+\field{num_bitrate_caps}, respectively.
+
+For each coded format in the \field{coded_formats_bitmask} there MUST be
+at least one element of \field{format_deps} referencing it.
+
+For each raw format in the \field{raw_formats_bitmask} there MUST be
+at least one element of \field{format_deps} referencing it.
+
+For any coded and any raw format there MUST be at most one element of
+\field{format_deps} referencing both of them.
+
+Elements of \field{format_deps} SHOULD be ordered according to raw format
+preferences of the device from preferred to not preferred ones.
+
+For each raw format in the \field{raw_formats_bitmask} there MUST be
+exactly one element of \field{raw_format_caps} referencing it.
+
+For each coded format in the \field{coded_formats_bitmask} there MUST be
+exactly one element of \field{coded_resources_caps} referencing it.
+
+For each raw format in the \field{raw_formats_bitmask} there MUST be
+exactly one element of \field{raw_resources_caps} referencing it.
+
+If VIRTIO_VIDEO_PARAM_BITRATE is supported, then for each coded format in
+the \field{coded_formats_bitmask} there MUST be exactly one element of
+\field{bitrate_caps} referencing it.
+
+The total size of the response MUST be equal to \field{caps_length}
+bytes, as reported by the device configuration.
+
+\subparagraph{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Format dependencies}
+
+The description of dependencies between coded and raw formats
+\field{virtio_video_format_dependency} is defined as follows:
+
+\begin{lstlisting}
+struct virtio_video_format_dependency {
+        le32 coded_formats_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_CODED_FORMAT_*) */
+        le32 raw_format; /* VIRTIO_VIDEO_RAW_FORMAT_* */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{coded_formats_bitmask}]
+  specifies coded formats, see
+  \ref{sec:Device Types / Video Device / Supported parameters / Supported coded formats}.
+  If a bit for a specific coded format is set, then this coded format can be
+  decoded into the specified raw format or encoded from it.
+\item[\field{raw_format}]
+  is a raw format, see
+  \ref{sec:Device Types / Video Device / Supported parameters / Supported raw formats}.
+\end{description}
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Format dependencies}{Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Format dependencies}
+
+\field{coded_formats_bitmask} MUST be a subset of \field{coded_formats_bitmask}
+field of \field{struct virtio_video_device_query_caps_resp}.
+
+\field{coded_formats_bitmask} MUST specify at least one coded format.
+
+\field{raw_format} MUST be set to one of the supported raw formats according to
+the \field{raw_formats_bitmask} field of
+\field{struct virtio_video_device_query_caps_resp}.
+
+\subparagraph{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Raw format capabilities}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Raw format capabilities}
+
+The raw format capability description \field{virtio_video_raw_format_caps} is
+defined as follows:
+
+\begin{lstlisting}
+enum virtio_video_planes_layout {
+        VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER = 1,
+        VIRTIO_VIDEO_PLANES_LAYOUT_MULTI_BUFFERS = 2,
+};
+
+struct virtio_video_range {
+        le32 min;
+        le32 max;
+        le32 step;
+        u8 padding[4];
+};
+
+struct virtio_video_raw_format_caps {
+        le32 raw_formats_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_RAW_FORMAT_*) */
+        le32 planes_layouts; /* Bitmask of VIRTIO_VIDEO_PLANES_LAYOUT_* */
+        le32 plane_align;
+        le32 stride_align_mask;
+        struct virtio_video_range width_range;
+        struct virtio_video_range height_range;
+};
+\end{lstlisting}
+
+\field{struct virtio_video_range} is used to represent a range of values.
+An integer \(x\) is within the range \field{r} if
+\(\field{r.min} \le x \le \field{r.max}\) holds and \(x\) equals to
+\((\field{min} + \field{step} * n)\) for some integer \(n\).
+
+\begin{description}
+\item[\field{raw_formats_bitmask}]
+  specifies raw formats, see
+  \ref{sec:Device Types / Video Device / Supported parameters / Supported raw formats},
+  to which these capabilities apply.
+\item[\field{planes_layouts}]
+  is a bitmask with the set of plane layout types from
+  \field{enum virtio_video_planes_layout}.
+\item[\field{plane_align}]
+  is the alignment of planes within a buffer in bytes. This field is valid
+  only if \field{planes_layouts} has the
+  \field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER} bit set.
+\item[\field{stride_align_mask}]
+  is a mask of all supported power of two stride alignments.
+\item[\field{width_range}]
+  is a range of widths in pixels.
+\item[\field{height_range}]
+  is a range of heights in pixels.
+\end{description}
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Raw format capabilities}{Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Raw format capabilities}
+
+\field{raw_formats_bitmask} MUST be a subset of \field{raw_formats_bitmask}
+field of \field{struct virtio_video_device_query_caps_resp}.
+
+\field{raw_formats_bitmask} MUST specify at least one raw format.
+
+The device MUST set \field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER} bit in
+\field{planes_layouts} if the plane layout with planes of a frame laid out one
+after another in the same buffer is supported.
+
+The device MUST set \field{VIRTIO_VIDEO_PLANES_LAYOUT_MULTI_BUFFERS} bit in
+\field{planes_layouts} if the plane layout with planes of a frame laid out in
+separate buffers is supported.
+
+\field{plane_align} MUST be set to a power of two according to the device
+plane alignment requirements if \field{planes_layouts} has the
+\field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER} bit set or to zero otherwise.
+
+\field{min}, \field{step} and \field{max} MUST be positive.
+
+\field{min} MUST be less then or equal to \field{max} within the same range.
+
+\subparagraph{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Resource capabilities}
+
+The CODED resource capabilities \field{virtio_video_coded_resources_caps} is
+defined as follows:
+
+\begin{lstlisting}
+struct virtio_video_coded_resources_caps {
+        le32 coded_formats_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_CODED_FORMAT_*) */
+        le32 min_resources;
+        le32 max_resources;
+        le32 buffer_size;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{coded_formats_bitmask}]
+  specifies coded formats, see
+  \ref{sec:Device Types / Video Device / Supported parameters / Supported coded formats},
+  to which these capabilities apply.
+\item[\field{min_resources}]
+  is the minimum number of resources that the CODED queue supports for all
+  the specified coded formats.
+\item[\field{max_resources}]
+  is the maximum number of resources that the CODED queue supports for all
+  the specified coded formats.
+\item[\field{buffer_size}]
+  is the minimum size of the buffers that will back resources to be queued.
+\end{description}
+
+The RAW resource capabilities \field{virtio_video_raw_resources_caps} is
+defined as follows:
+
+\begin{lstlisting}
+struct virtio_video_raw_resources_caps {
+        le32 raw_formats_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_RAW_FORMAT_*) */
+        le32 min_resources;
+        le32 max_resources;
+        u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{raw_formats_bitmask}]
+  specifies raw formats, see
+  \ref{sec:Device Types / Video Device / Supported parameters / Supported raw formats},
+  to which these capabilities apply.
+\item[\field{min_resources}]
+  is the minimum number of resources that the RAW queue supports for all
+  the specified raw formats.
+\item[\field{max_resources}]
+  is the maximum number of resources that the RAW queue supports for all
+  the specified raw formats.
+\end{description}
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Resource capabilities}{Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Resource capabilities}
+
+\field{coded_formats_bitmask} MUST be a subset of \field{coded_formats_bitmask}
+field of \field{struct virtio_video_device_query_caps_resp}.
+
+\field{coded_formats_bitmask} MUST specify at least one coded format.
+
+\field{raw_formats_bitmask} MUST be a subset of \field{raw_formats_bitmask}
+field of \field{struct virtio_video_device_query_caps_resp}.
+
+\field{raw_formats_bitmask} MUST specify at least one raw format.
+
+\field{min_resources} MUST NOT be negative.
+
+\field{max_resources} MUST be greater then or equal to \field{min_resources}
+within the same struct instance.
+
+\subparagraph{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Bitrates}
+
+The bitrate capabilities \field{virtio_video_bitrate_caps} is
+defined as follows:
+
+\begin{lstlisting}
+struct virtio_video_bitrate_caps {
+        le32 coded_formats_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_CODED_FORMAT_*) */
+        le32 min_bitrate;
+        le32 max_bitrate;
+        u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{coded_formats_bitmask}]
+  specifies coded formats, see
+  \ref{sec:Device Types / Video Device / Supported parameters / Supported coded formats},
+  to which these capabilities apply.
+\item[\field{min_bitrate}]
+  is the minimum bitrate in bits per second supported by the encoder for all the specified coded
+  formats.
+\item[\field{max_bitrate}]
+  is the maximum bitrate in bits per second supported by the encoder for all the specified coded
+  formats.
+\end{description}
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Bitrates}{Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Bitrates}
+
+\field{coded_formats_bitmask} MUST be a subset of \field{coded_formats_bitmask}
+field of \field{struct virtio_video_device_query_caps_resp}.
+
+\field{coded_formats_bitmask} MUST specify at least one coded format.
+
+\field{min_bitrate} MUST NOT be negative.
+
+\field{max_bitrate} MUST be greater then or equal to \field{min_bitrate}
+within the same \field{struct virtio_video_bitrate_caps} instance.
+
+\subsubsection{Device Operation: Stream commands}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands}
+
+Stream commands allow the creation, destruction, and flow control of a
+stream.
+
+\paragraph{VIRTIO_VIDEO_CMD_STREAM_CREATE}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_CREATE}
+
+Create a new stream using the device.
+
+The driver sends this command with
+\field{struct virtio_video_stream_create}:
+
+\begin{lstlisting}
+struct virtio_video_stream_create {
+        le32 cmd_type; /* VIRTIO_VIDEO_CMD_STREAM_CREATE */
+};
+\end{lstlisting}
+
+The device responds with \field{struct virtio_video_stream_create_resp}:
+
+\begin{lstlisting}
+struct virtio_video_stream_create_resp {
+        le32 result; /* VIRTIO_VIDEO_RESULT_* */
+        le32 stream_id;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{result}]
+  is
+
+  \begin{description}
+  \item[VIRTIO_VIDEO_RESULT_OK]
+    if the operation succeeded,
+  \item[VIRTIO_VIDEO_RESULT_ERR_OUT_OF_MEMORY]
+    if the limit of simultaneous streams has been reached by the device and
+    no more can be created.
+  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION]
+    if the stream cannot be created due to an unexpected device issue.
+  \end{description}
+\item[\field{stream_id}]
+  is the ID of the created stream allocated by the device.
+\end{description}
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_CREATE}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_CREATE}
+
+\field{stream_id} MUST be set to a device-unique identifier that remains
+valid as long as the stream is alive.
+
+\paragraph{VIRTIO_VIDEO_CMD_STREAM_DESTROY}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DESTROY}
+
+% DESTROY has to be more like RESET, not DRAIN, because it is called, for
+% example, when the guest user-space app closes a file descriptor. So there
+% is no sense in continuing the processing.
+
+Destroy a video stream and all its resources. Any activity on the stream
+is halted and all resources are released by the time the delayed response is
+received by the driver.
+
+The driver sends this command with
+\field{struct virtio_video_stream_destroy}:
+
+\begin{lstlisting}
+struct virtio_video_stream_destroy {
+        le32 cmd_type; /* VIRTIO_VIDEO_CMD_STREAM_DESTROY */
+        le32 stream_id;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{stream_id}]
+  is the ID of the stream to be destroyed, as previously returned by
+  VIRTIO_VIDEO_CMD_STREAM_CREATE.
+\end{description}
+
+The device responds as described in
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueue}
+and begins the background DESTROY operation.
+
+When the command is completed the device sends the
+VIRTIO_VIDEO_DELAYED_RESP_STREAM_DESTROY delayed response, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}.
+The delayed response can also come in case of unrecoverable stream error, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events / Error Event}.
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_DESTROY}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DESTROY}
+
+Before the device sends a delayed response to VIRTIO_VIDEO_CMD_STREAM_DESTROY,
+it MUST send all other pending delayed responses with
+VIRTIO_VIDEO_EVENT_FLAG_CANCELED flag set and detach all resources.
+
+After VIRTIO_VIDEO_CMD_STREAM_DESTROY is queued, the device MUST reply with
+VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID to any subsequently queued command
+with this stream ID.
+
+The DESTROY operation MUST NOT be canceled.
+
+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_DESTROY}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DESTROY}
+
+\field{stream_id} MUST be set to a valid stream ID previously returned
+by VIRTIO_VIDEO_CMD_STREAM_CREATE.
+
+The driver MUST stop using \field{stream_id} as a valid stream after it
+received the delayed response to this command.
+
+\paragraph{VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}
+
+Write values of selected parameters of a given stream, and receive back the
+values for all the parameters supported by the device as reported by
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}.
+The operation can be either executed immediately, or queued into the INPUT
+queue, i.e. after processing all the INPUT queue elements that are queued
+before the command.
+
+The driver sends this command with
+\field{struct virtio_video_stream_set_params}:
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_SET_PARAMS_FLAG_IN_BAND  (1 << 0)
+
+struct virtio_video_stream_set_params {
+        le32 cmd_type; /* VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS */
+        le32 stream_id;
+        le32 flags; /* Bitmask of VIRTIO_VIDEO_SET_PARAMS_FLAG_* */
+        u8 padding[4];
+        struct virtio_video_params params;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{stream_id}]
+  is the ID of the stream we want to set a parameter for.
+\item[\field{flags}]
+  is a bitmask of VIRTIO_VIDEO_SET_PARAMS_FLAG_* values.
+
+  \begin{description}
+  \item[\field{VIRTIO_VIDEO_SET_PARAMS_FLAG_IN_BAND}]
+    The submitted parameters are to be set only after all of the previously
+    queued INPUT queue elements are processed. Without this flag the
+    parameters are set Immediately.
+  \end{description}
+\item[\field{params}]
+  is a container for the selected stream parameters to be set.
+\end{description}
+
+The device responds as described in
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueue}
+and begins the background SET_PARAMS operation.
+
+When the background processing of the resource is completed the device sends
+the VIRTIO_VIDEO_DELAYED_RESP_STREAM_SET_PARAMS delayed response, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}.
+The delayed response can also come in case of dynamic parameters change, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events / Dynamic Parameters Change Event}.
+
+The command-specific delayed response
+\field{struct virtio_video_stream_set_params_delayed_resp} is defined
+as follows:
+
+\begin{lstlisting}
+struct virtio_video_stream_set_params_delayed_resp {
+        struct virtio_video_params params;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{params}]
+  is a container for the actual values of all the parameters supported by the
+  device. The values set by the device may differ from the requested values
+  depending on the device's capabilities.
+\end{description}
+
+The \field{struct virtio_video_params} is defined as follows:
+
+\begin{lstlisting}
+struct virtio_video_raw_format {
+        le32 format;
+        le32 planes_layout; /* VIRTIO_VIDEO_PLANES_LAYOUT_* */
+        le32 stride;
+        le32 width;
+        le32 height;
+        u8 padding[4];
+};
+
+struct virtio_video_param_crop {
+        le32 left;
+        le32 top;
+        le32 width;
+        le32 height;
+};
+
+union virtio_video_codec_params {
+        struct virtio_video_mpeg2_params mpeg2;
+        struct virtio_video_mpeg4_params mpeg4;
+        struct virtio_video_h264_params h264;
+        struct virtio_video_hevc_params hevc;
+        struct virtio_video_vp8_params vp8;
+        struct virtio_video_vp9_params vp9;
+};
+
+struct virtio_video_params {
+        le32 stream_params_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_PARAM_*) */
+        le32 coded_format; /* If MASK(VIRTIO_VIDEO_PARAM_CODED_FORMAT) is set. */
+        /* If MASK(VIRTIO_VIDEO_PARAM_RAW_FORMAT) is set. */
+        struct virtio_video_raw_format raw_format;
+        /* If MASK(VIRTIO_VIDEO_PARAM_CODED_RESOURCES) is set. */
+        struct virtio_video_param_resources coded_resources;
+        /* If MASK(VIRTIO_VIDEO_PARAM_RAW_RESOURCES) is set. */
+        struct virtio_video_param_resources raw_resources;
+        struct virtio_video_param_crop crop; /* If MASK(VIRTIO_VIDEO_PARAM_CROP) is set. */
+        le32 bitrate; /* If MASK(VIRTIO_VIDEO_PARAM_BITRATE) is set. */
+        u8 padding[4];
+        /* If the corresponding MASK(VIRTIO_VIDEO_PARAM_GROUP_CODEC_*) is set
+        * depending on the coded_format. */
+        union virtio_video_codec_params codec;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{stream_params_bitmask}]
+  is a bitmask of supported stream parameters.
+\item[\field{coded_format}]
+  is a coded format of the CODED queue, see
+  \ref{sec:Device Types / Video Device / Supported parameters}.
+\item[\field{raw_format}]
+  is a raw format of the RAW queue including related parameters
+
+  \begin{description}
+  \item[\field{format}]
+    is the actual format, see
+    \ref{sec:Device Types / Video Device / Supported parameters / Supported raw formats}.
+  \item[\field{planes_layout}]
+    is the actual layout of the planes, see
+    \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Raw format capabilities}.
+  \item[\field{stride}]
+    is the distance in bytes between two lines of data.
+  \item[\field{width}]
+    is the width in pixels of the stream frames.
+  \item[\field{height}]
+    is the height in pixels of the stream frames.
+  \end{description}
+\item[\field{coded_resources}]
+  is the CODED queue resources parameters, see
+  \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}.
+\item[\field{raw_resources}]
+  is the RAW queue resources parameters, see
+  \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}.
+\item[\field{crop}]
+  is the rectangle covering the visible size of the frame, i.e the part of
+  the frame that should be displayed, \field{width} and \field{height} are
+  relative to \field{left} and \field{top}.
+\item[\field{bitrate}]
+  is the current desired bitrate for the encoder. This can be changed at
+  any moment by the driver and will apply to subsequently submitted frames.
+\item[\field{codec}]
+  consists of codec-specific parameters, see
+  \ref{sec:Device Types / Video Device / Codec-specific parameters} for the
+  definitions. Not available until \field{coded_format} is set.
+\end{description}
+
+Successfully setting \field{coded_format}, \field{coded_resources},
+\field{raw_format} or \field{raw_resources} starts with an implicit
+background DRAIN operation if the corresponding queue has any queued
+resources, then all the remaining elements in the queue are cancelled if
+there are any and then all currently attached resources of the queue are
+detached if there are any, i.e. the driver cannot queue a resource to the
+queue without attaching some backing memory first.
+
+% Use-case: for the decoder, resolution can be set manually by the driver
+% (useful for codecs that do not embed this information). The processing
+% sequence should the look similar to the dynamic parameters change case.
+
+\field{struct virtio_video_param_resources} is used to control the
+number of resources and their backing memory type for the INPUT and
+OUTPUT queues:
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES       0x1
+#define VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT     0x2
+
+struct virtio_video_param_resources {
+        le32 num_resources;
+        u8 mem_type; /* VIRTIO_VIDEO_MEM_TYPE_* */
+        u8 padding[3];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{num_resources}]
+  is the number of resources that can be addressed for the queue, numbered
+  from \(0\) to \(num\_resources - 1\). Can be equal to zero if no
+  resources are allocated, otherwise will be comprised between
+  \field{min_resources} and \field{max_resources}.
+\item[\field{mem_type}]
+  is the memory type that will be used to back these resources.
+\end{description}
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}
+
+The device MUST initialize each parameter to a valid default value.
+
+The device MUST allow each parameter to be read even without the driver
+explicitly setting a value for them beforehand.
+
+\field{stream_params_bitmask} MUST be a subset of \field{stream_params_bitmask}
+field of \field{struct virtio_video_device_query_caps_resp}.
+
+The fields \field{coded_format}, \field{raw_format}, \field{coded_resources},
+\field{raw_resources}, \field{bitrate}, \field{codec} MUST be set according
+to the capabilities returned by VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}.
+The conformance check MUST be performed before the command response is sent.
+
+\field{stream_params_bitmask} MAY contain at most one of
+VIRTIO_VIDEO_PARAM_GROUP_CODEC_* bits. This bit MUST correspond to the
+coded format selected with \field{coded_format}.
+
+The device MAY adjust any requested parameter to a closest supported
+value if the requested one is not supported with the current settings.
+
+There MAY be at most one out of band SET_PARAMS operations at the same time.
+The amount of in band SET_PARAMS operations at the same time MUST NOT exceed
+the number of input resources.
+
+The parameters MUST be applied in the same order as in
+\ref{sec:Device Types / Video Device / Supported parameters / Supported stream parameters}.
+
+When \field{coded_format}, \field{coded_resources},
+\field{raw_format} or \field{raw_resources} are being changed, the device
+MUST first check if there are any queued resources in the corresponding
+queue. If there are any the device MUST run a DRAIN operation in the same way
+as with VIRTIO_VIDEO_CMD_STREAM_DRAIN except that sending
+VIRTIO_VIDEO_DELAYED_RESP_STREAM_DRAIN MUST be omitted. Then the device MUST
+cancel all remaining elements in the queue if there are any. Then the device
+MUST detach all attached resources of the queue if there are any. Then the
+device MUST set the requested parameters and send the delayed response. Any
+subsequent operations using the queue MUST be blocked until the first
+resource is attached and queued again. All these steps MUST be performed
+before processing any subsequent commands.
+
+The device MUST process parameters changes, that are embedded in the input
+stream, in the same way as if there is an in band
+VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS command changing the OUTPUT queue
+parameters. A standalone DPC event MUST be sent instead of the command's
+delayed response in this case.
+
+The device MUST return all the available parameters in the delayed response
+to the command. \field{codec} is not available until \field{coded_format}
+is set.
+
+% TODO define when changing other parameters is allowed.
+
+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}
+
+\field{stream_id} MUST be set to a valid stream ID previously returned
+by VIRTIO_VIDEO_CMD_STREAM_CREATE.
+
+The driver MUST fill the fields according to the parameters selected with
+\field{stream_params_bitmask}. All the other fields MUST be set to zero.
+
+The driver MUST check the actual values of the parameters as set by the
+device and work with these values, or try to set a different one if it
+cannot, or fail properly.
+
+After creating a new stream, the initial value of all parameters is
+undefined to the driver. Thus, the driver MUST NOT assume the default
+value of any parameter and MAY use VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS
+in order to get the values of the parameters it needs.
+
+The driver SHOULD NOT send any in band SET_PARAMS commands or QUEUE commands
+on the INPUT queue before receiving the delayed response, when changing the
+\field{coded_format} or \field{coded_resources} for decoder or
+\field{raw_format} or \field{raw_resources} for encoder.
+
+If some of the resources were detached as a result of this command the
+driver SHOULD maybe reallocate and reattach the backing memories of these
+resources and queue them again to resume the device operation.
+
+\paragraph{VIRTIO_VIDEO_CMD_STREAM_DRAIN}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DRAIN}
+
+Complete processing of all INPUT queue elements queued before this command
+and make the resulting output resources available to the driver.
+
+The driver sends this command with
+\field{struct virtio_video_stream_drain}:
+
+\begin{lstlisting}
+struct virtio_video_stream_drain {
+        le32 cmd_type; /* VIRTIO_VIDEO_CMD_STREAM_DRAIN */
+        le32 stream_id;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{stream_id}]
+  is the ID of the stream to drain, as previously returned by
+  VIRTIO_VIDEO_CMD_STREAM_CREATE.
+\end{description}
+
+The device responds as described in
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueue}
+and begins the background DRAIN operation.
+
+When the background DRAIN operation is completed the device sends the
+VIRTIO_VIDEO_DELAYED_RESP_STREAM_DRAIN delayed response, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}.
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_DRAIN}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DRAIN}
+
+Before the device sends the response, it MUST process and respond to all
+the VIRTIO_VIDEO_CMD_RESOURCE_QUEUE commands on the INPUT queue that
+were sent before the drain command, and make all the corresponding
+output resources available to the driver by responding to their
+VIRTIO_VIDEO_CMD_RESOURCE_QUEUE command.
+
+The device MUST be able to accept input work while a DRAIN operation
+is ongoing, but any resulting delayed responses MUST NOT be sent before
+the delayed response to the DRAIN command.
+
+The amount of DRAIN operations at the same time in the INPUT queue MUST NOT
+exceed the number of input resources. The device MUST return
+VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION if the number is exceeded.
+
+If the command is interrupted with a VIRTIO_VIDEO_CMD_STREAM_RESET
+or VIRTIO_VIDEO_CMD_STREAM_DESTROY commands, the device MUST
+send the delayed response with VIRTIO_VIDEO_EVENT_FLAG_CANCELED flag set.
+
+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_DRAIN}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DRAIN}
+
+\field{stream_id} MUST be set to a valid stream ID previously returned
+by VIRTIO_VIDEO_CMD_STREAM_CREATE.
+
+The driver MUST keep queueing output resources until it gets the
+response to this command or cancels it using
+VIRTIO_VIDEO_CMD_STREAM_RESET or
+VIRTIO_VIDEO_CMD_STREAM_DESTROY. Failure to do so may result in the
+device stalling as it waits for output resources to write into.
+
+The driver MUST account for the fact that the response to this command
+might come out-of-order (i.e. after other commands sent to the device),
+and that it can be interrupted.
+
+The driver MUST send a DRAIN command when it does not have any further
+input, in order to ensure it receives all the output corresponding to
+the stream.
+
+\paragraph{VIRTIO_VIDEO_CMD_STREAM_RESET}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_RESET}
+
+Immediately cancel all INPUT queue elements queued before this command
+without processing them and discard any processing results in the output
+resources, that are not yet dequeued. This command is mostly useful for
+decoders that need to quickly jump from one point of the stream to another
+(i.e. seeking), or in order to stop processing as quickly as possible.
+
+The driver sends this command with
+\field{struct virtio_video_stream_reset}:
+
+\begin{lstlisting}
+struct virtio_video_stream_reset {
+        le32 cmd_type; /* VIRTIO_VIDEO_CMD_STREAM_RESET */
+        le32 stream_id;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{stream_id}]
+  is the ID of the stream to reset, as previously returned by
+  VIRTIO_VIDEO_CMD_STREAM_CREATE.
+\end{description}
+
+The device responds as described in
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueue}
+and begins the background RESET operation.
+
+When the background RESET operation is completed the device sends the
+VIRTIO_VIDEO_DELAYED_RESP_STREAM_RESET delayed response, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}.
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_RESET}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_RESET}
+
+The device MUST send delayed responses with VIRTIO_VIDEO_EVENT_FLAG_CANCELED
+flag set for a background DRAIN operation and VIRTIO_VIDEO_CMD_RESOURCE_QUEUE
+commands on the INPUT queue before responding to this command.
+
+While the device is processing the command, it MUST return
+VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION to any subsequent
+VIRTIO_VIDEO_CMD_STREAM_RESET commands.
+
+The device MUST be able to accept input work while a RESET operation
+is ongoing, but any resulting delayed responses MUST NOT be sent before
+the delayed response to the RESET command.
+
+The device MUST interrupt operation as quickly as possible, and not be
+dependent on output resources being queued by the driver.
+
+Upon resuming processing, the device MAY skip input data until it finds
+a point that allows it to resume operation properly (e.g. until a
+keyframe is found in the input stream of a decoder).
+
+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_RESET}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_RESET}
+
+\field{stream_id} MUST be set to a valid stream ID previously returned
+by VIRTIO_VIDEO_CMD_STREAM_CREATE.
+
+Upon receiving the response to this command, the driver SHOULD process
+(or drop) any output resource before resuming operation by queueing new
+input resources.
+
+Upon receiving the response to this command, the driver MAY modify the
+\field{struct virtio_video_param_resources} parameter corresponding to
+the INPUT queue, and subsequently attach new backing memory to the input
+resources using the VIRTIO_VIDEO_CMD_RESOURCE_ATTACH_BACKING
+command.
+
+\subsubsection{Device Operation: Resource Commands}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Resource Commands}
+
+Resource commands manage the memory backing of individual resources and
+queue them for the device to process.
+
+\paragraph{VIRTIO_VIDEO_CMD_RESOURCE_ATTACH_BACKING}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Resource Commands / VIRTIO_VIDEO_CMD_RESOURCE_ATTACH_BACKING}
+
+Attach backing memory to a resource.
+
+The driver sends this command with
+\field{struct virtio_video_resource_attach_backing}:
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_QUEUE_TYPE_INPUT       0
+#define VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT      1
+
+struct virtio_video_resource_attach_backing {
+        le32 cmd_type; /* VIRTIO_VIDEO_CMD_RESOURCE_ATTACH_BACKING */
+        le32 stream_id;
+        le32 queue_type; /* VIRTIO_VIDEO_QUEUE_TYPE_* */
+        le32 resource_id;
+        union virtio_video_resource resources[];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{stream_id}]
+  is the ID of a valid stream.
+\item[\field{queue_type}]
+  is the direction of the queue.
+\item[\field{resource_id}]
+  is the ID of the resource to be attached to.
+\item[\field{resources}]
+  specifies memory regions to attach.
+% TODO add number of resources?
+\end{description}
+
+The union \field{virtio_video_resource} is defined as follows:
+
+\begin{lstlisting}
+union virtio_video_resource {
+        struct virtio_video_resource_sg_list sg_list;
+        struct virtio_video_resource_object object;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{sg_list}]
+  represents a scatter-gather list. This variant can be used when the
+  \field{mem_type} member of the \field{virtio_video_param_resources}
+  corresponding to the queue is set to
+  VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES, see
+  \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}.
+\item[\field{object}]
+  represents an object exported from another virtio device as defined in
+  \ref{sec:Basic Facilities of a Virtio Device / Exporting Objects}.
+  This variant can be used when the \field{mem_type} member of the
+  \field{virtio_video_param_resources} corresponding to the queue is set
+  to VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT, see
+  \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}.
+\end{description}
+
+The struct \field{virtio_video_resource_sg_list} is defined as follows:
+
+\begin{lstlisting}
+struct virtio_video_resource_sg_entry {
+        le64 addr;
+        le32 length;
+        u8 padding[4];
+};
+
+struct virtio_video_resource_sg_list {
+        le32 num_entries;
+        u8 padding[4];
+        /* Followed by num_entries instances of
+           virtio_video_resource_sg_entry */
+};
+\end{lstlisting}
+
+Within \field{struct virtio_video_resource_sg_entry}:
+
+\begin{description}
+\item[\field{addr}]
+  is a guest physical address to the start of the SG entry. Must be
+  aligned to the size of physical guest pages.
+\item[\field{length}]
+  is the length of the SG entry in bytes. Must be aligned to the size
+  of physical guest pages.
+\end{description}
+
+Finally, for \field{struct virtio_video_resource_sg_list}:
+
+\begin{description}
+\item[\field{num_entries}]
+  is the number of \field{struct virtio_video_resource_sg_entry} instances
+  that follow.
+\end{description}
+
+\field{struct virtio_video_resource_object} is defined as follows:
+
+\begin{lstlisting}
+struct virtio_video_resource_object {
+        u8 uuid[16];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[uuid]
+  is a version 4 UUID specified by \hyperref[intro:rfc4122]{[RFC4122]}.
+\end{description}
+
+The device responds with
+\field{struct virtio_video_resource_attach_backing_resp}:
+
+\begin{lstlisting}
+struct virtio_video_resource_attach_backing_resp {
+        le32 result; /* VIRTIO_VIDEO_RESULT_* */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{result}]
+  is
+
+  \begin{description}
+  \item[VIRTIO_VIDEO_RESULT_OK]
+    if the operation succeeded,
+  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID]
+    if the mentioned stream does not exist,
+  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_RESOURCE_ID]
+    if the mentioned resource does not exist,
+  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_ARGUMENT]
+    if \field{queue_type} or \field{resources} have an invalid value,
+  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION]
+    if the operation is performed at a time when it is not valid.
+  \end{description}
+\end{description}
+
+VIRTIO_VIDEO_CMD_RESOURCE_ATTACH_BACKING can only be called during
+the following times:
+
+\begin{itemize}
+\item
+  AFTER a VIRTIO_VIDEO_CMD_STREAM_CREATE and BEFORE invoking
+  VIRTIO_VIDEO_CMD_RESOURCE_QUEUE for the first time on the
+  resource,
+\item
+  AFTER successfully changing the \field{virtio_video_param_resources}
+  parameter corresponding to the queue and BEFORE
+  VIRTIO_VIDEO_CMD_RESOURCE_QUEUE is called again on the resource.
+\end{itemize}
+
+This is to ensure that the device can rely on the fact that a given
+resource will always point to the same memory for as long as it may be
+used by the video device. For instance, a decoder may use returned
+decoded frames as reference for future frames and won't overwrite the
+backing resource of a frame that is being referenced. It is only before
+a stream is started and after a Dynamic Parameters Change event has
+occurred that we can be sure that all resources won't be used in that
+way.
+
+% TODO add a requirement for the driver or the device to handle a case
+% when a still referenced frame is queued again. So that it is less likely
+% to be forgotten.
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_RESOURCE_ATTACH_BACKING}{Device Types / Video Device / Device Operation / Device Operation: Resource Commands / VIRTIO_VIDEO_CMD_RESOURCE_ATTACH_BACKING}
+
+At any time other than the times valid for calling this command, the
+device MUST return VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION.
+
+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_RESOURCE_ATTACH_BACKING}{Device Types / Video Device / Device Operation / Device Operation: Resource Commands / VIRTIO_VIDEO_CMD_RESOURCE_ATTACH_BACKING}
+
+\field{stream_id} MUST be set to a valid stream ID previously returned
+by VIRTIO_VIDEO_CMD_STREAM_CREATE.
+
+\field{queue_type} MUST be set to a valid queue type.
+
+\field{resource_id} MUST be an integer inferior to the number of
+resources currently allocated for the queue.
+
+The length of the \field{resources} array of
+\field{struct virtio_video_resource_attach_backing} MUST be equal to the
+number of resources required by the format currently set on the queue,
+as described in
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}.
+
+\paragraph{VIRTIO_VIDEO_CMD_RESOURCE_QUEUE}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Resource Commands / VIRTIO_VIDEO_CMD_RESOURCE_QUEUE}
+
+Add a resource to the device's queue.
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_MAX_PLANES                    8
+
+#define VIRTIO_VIDEO_ENQUEUE_FLAG_FORCE_KEY_FRAME  (1 << 0)
+
+struct virtio_video_resource_queue {
+        le32 cmd_type; /* VIRTIO_VIDEO_CMD_RESOURCE_QUEUE */
+        le32 stream_id;
+        le32 queue_type; /* VIRTIO_VIDEO_QUEUE_TYPE_* */
+        le32 resource_id;
+        le32 flags; /* Bitmask of VIRTIO_VIDEO_ENQUEUE_FLAG_* */
+        u8 padding[4];
+        le64 timestamp;
+        le32 offsets[VIRTIO_VIDEO_MAX_PLANES];
+        le32 data_sizes[VIRTIO_VIDEO_MAX_PLANES];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{stream_id}]
+  is the ID of a valid stream.
+\item[\field{queue_type}]
+  is the direction of the queue.
+\item[\field{resource_id}]
+  is the ID of the resource to be queued.
+\item[\field{flags}]
+  is a bitmask of VIRTIO_VIDEO_ENQUEUE_FLAG_* values.
+
+  \begin{description}
+  \item[\field{VIRTIO_VIDEO_ENQUEUE_FLAG_FORCE_KEY_FRAME}]
+    The submitted frame is to be encoded as a key frame. Only valid for the
+    encoder's INPUT queue.
+  \end{description}
+\item[\field{timestamp}]
+  is an abstract sequence counter that can be used on the INPUT queue for
+  synchronization. Resources produced on the output queue will carry the
+  \field{timestamp} of the first input resource they have been produced
+  from.
+% TODO take note about timestamps from V4L2 spec
+\item[\field{offsets}]
+  is the starting offset for the data in the buffer for each plane.
+  The number of planes depends on the format. Set by the driver for input
+  resources.
+\item[\field{data_sizes}]
+  is number of data bytes used for each plane. Set by the driver for input
+  resources.
+\end{description}
+
+The device responds as described in
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueue}
+and puts the resource in the selected queue for background processing.
+
+When the background processing of the resource is completed the device sends
+the VIRTIO_VIDEO_DELAYED_RESP_RESOURCE_QUEUE delayed response, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}.
+
+The command-specific delayed response
+\field{struct virtio_video_resource_queue_delayed_resp} is defined
+as follows:
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_DEQUEUE_FLAG_ERR           (1 << 0)
+/* Encoder only */
+#define VIRTIO_VIDEO_DEQUEUE_FLAG_KEY_FRAME     (1 << 1)
+#define VIRTIO_VIDEO_DEQUEUE_FLAG_P_FRAME       (1 << 2)
+#define VIRTIO_VIDEO_DEQUEUE_FLAG_B_FRAME       (1 << 3)
+
+struct virtio_video_resource_queue_delayed_resp {
+        le32 queue_type; /* VIRTIO_VIDEO_QUEUE_TYPE_* */
+        le32 resource_id;
+        le32 flags;
+        u8 padding[4];
+        le64 timestamp;
+        le32 offsets[VIRTIO_VIDEO_MAX_PLANES];
+        le32 data_sizes[VIRTIO_VIDEO_MAX_PLANES];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{queue_type}]
+  is the direction of the queue.
+\item[\field{resource_id}]
+  is the ID of the dequeued resource.
+\item[\field{flags}]
+  is a bitmask of VIRTIO_VIDEO_DEQUEUE_FLAG_* flags.
+
+  \begin{description}
+  \item[VIRTIO_VIDEO_DEQUEUE_FLAG_ERR]
+    is set on resources when a non-fatal processing error has happened and
+    the data contained by the resource is likely to be corrupted,
+  \item[VIRTIO_VIDEO_DEQUEUE_FLAG_KEY_FRAME]
+    is set on output resources when the resource contains an encoded key
+    frame (only for encoders).
+  \item[VIRTIO_VIDEO_DEQUEUE_FLAG_P_FRAME]
+    is set on output resources when the resource contains only differences
+    to a previous key frame (only for encoders).
+  \item[VIRTIO_VIDEO_DEQUEUE_FLAG_B_FRAME]
+    is set on output resources when the resource contains only the
+    differences between the current frame and both the preceding and
+    following key frames (only for encoders).
+  \end{description}
+\item[\field{timestamp}]
+  is set on output resources to the \field{timestamp} value of the input
+  resource that produced the resource.
+\item[\field{offsets}]
+  is set on output resources to the starting offset for the data in the
+  buffer for each plane.
+\item[\field{data_sizes}]
+  is set on output resources to the amount of data written by the device,
+  for each plane.
+\end{description}
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_RESOURCE_QUEUE}{Device Types / Video Device / Device Operation / Device Operation: Resource Commands / VIRTIO_VIDEO_CMD_RESOURCE_QUEUE}
+
+The device MUST return VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION if
+VIRTIO_VIDEO_CMD_RESOURCE_ATTACH_BACKING has not been
+successfully called on the resource prior to queueing it or for an
+attempt to queue a resources that is still processed in background.
+
+The device MUST mark resources that might contain corrupted content due to
+an error with the VIRTIO_VIDEO_BUFFER_FLAG_ERR flag.
+
+For output resources, the device MUST copy the \field{timestamp}
+parameter of the input resource that produced it into its response.
+% TODO rephrase?
+
+In case of encoder, the device MUST mark each output resource with one
+of VIRTIO_VIDEO_DEQUEUE_FLAG_KEY_FRAME,
+VIRTIO_VIDEO_DEQUEUE_FLAG_P_FRAME, or
+VIRTIO_VIDEO_DEQUEUE_FLAG_B_FRAME.
+
+If the processing of a resource was stopped due to a stream event, a
+VIRTIO_VIDEO_CMD_STREAM_RESET, or a VIRTIO_VIDEO_CMD_STREAM_DESTROY,
+the device MUST send the corresponding delayed responses with
+VIRTIO_VIDEO_EVENT_FLAG_CANCELED flag set.
+
+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_RESOURCE_QUEUE}{Device Types / Video Device / Device Operation / Device Operation: Resource Commands / VIRTIO_VIDEO_CMD_RESOURCE_QUEUE}
+
+\field{stream_id} MUST be set to a valid stream ID previously returned
+by VIRTIO_VIDEO_CMD_STREAM_CREATE.
+
+\field{queue_type} MUST be set to a valid queue type.
+
+\field{resource_id} MUST be an integer inferior to the number of
+resources currently allocated for the queue.
+
+The driver MUST account for the fact that the response to this command
+might come out-of-order (i.e. after other commands sent to the device),
+and that it can be interrupted.
+
+% TODO acourbot: The driver and device MUST follow requirements about
+% buffer ownership explained in
+% \ref{sec:Device Types / Video Device / Device Operation / Buffer lifecycle}.
+
+\subsubsection{Device Operation: Standalone Events}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}
+
+These events are caused by state changes in the device, not as a delayed
+response to any command.
+
+\paragraph{Error Event}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events / Error Event}
+
+The error event is sent by the device when an unrecoverable error occurs
+during processing a stream. The device operation is exactly the same as when
+it receives a VIRTIO_VIDEO_CMD_STREAM_DESTROY command, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DESTROY}.
+Note that this is different from dequeued resources carrying the
+VIRTIO_VIDEO_DEQUEUE_FLAG_ERR flag. This flag indicates that the
+particular output frame might be corrupted, but the stream still exists
+and can recover.
+
+\paragraph{Dynamic Parameters Change Event}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events / Dynamic Parameters Change Event}
+
+A Dynamic Parameters Change (or DPC) event is sent by a decoder device when it
+detects that the parameters of the stream being decoded have changed.
+The device operation is exactly the same as when it receives an in band
+VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS command at the exact same point in the
+stream, that changes OUTPUT queue parameters, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}.
+
+% TODO add QoS events and overall think about quotas. Codecs are normally
+% limited by bandwidth. How can we accommodate this?
+
+\subsection{Codec-specific parameters}
+\label{sec:Device Types / Video Device / Codec-specific parameters}
+
+The codec-specific controls follow V4L2 controls definitions, that can be
+found in \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+Human-readable descriptions for the codec-specific V4L2 controls can be found
+in \hyperref[intro:V4L2 codec controls]{V4L2 documentation}.
+
+\subsubsection{MPEG2}
+
+MPEG2 capabilities are defined as follows:
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_MPEG2_PARAM_PROFILE  1  /* Same as V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE */
+#define VIRTIO_VIDEO_MPEG2_PARAM_LEVEL    2  /* Same as V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL */
+
+struct virtio_video_mpeg2_caps {
+        le32 mpeg2_params_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_MPEG2_PARAM_*) */
+        le32 mpeg2_profiles_bitmask; /* Bitmask of MASK(V4L2_MPEG_VIDEO_MPEG2_PROFILE_*) */
+        le32 mpeg2_levels_bitmask; /* Bitmask of MASK(V4L2_MPEG_VIDEO_MPEG2_LEVEL_*) */
+        u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{mpeg2_params_bitmask}]
+  is a bitmask of supported MPEG2 codec parameters.
+\item[\field{mpeg2_profiles_bitmask}]
+  is a bitmask of supported MPEG2 profiles used as bit numbers, see
+  \field{enum v4l2_mpeg_video_mpeg2_profile} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\item[\field{mpeg2_levels_bitmask}]
+  is a bitmask of supported MPEG2 levels used as bit numbers, see
+  \field{enum v4l2_mpeg_video_mpeg2_level} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\end{description}
+
+MPEG2 parameters are defined as follows:
+
+\begin{lstlisting}
+struct virtio_video_mpeg2_params {
+        le32 mpeg2_params_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_MPEG2_PARAM_*) */
+        le32 mpeg2_profile; /* V4L2_MPEG_VIDEO_MPEG2_PROFILE_* */
+        le32 mpeg2_level; /* V4L2_MPEG_VIDEO_MPEG2_LEVEL_* */
+        u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{mpeg2_params_bitmask}]
+  is a bitmask of supported MPEG2 codec parameters.
+\item[\field{mpeg2_profile}]
+  is one of the supported MPEG2 profiles, see
+  \field{enum v4l2_mpeg_video_mpeg2_profile} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\item[\field{mpeg2_level}]
+  is one of the supported MPEG2 levels, see
+  \field{enum v4l2_mpeg_video_mpeg2_level} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\end{description}
+
+\subsubsection{MPEG4}
+
+MPEG4 capabilities are defined as follows:
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_MPEG4_PARAM_PROFILE  1  /* Same as V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE */
+#define VIRTIO_VIDEO_MPEG4_PARAM_LEVEL    2  /* Same as V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL */
+
+struct virtio_video_mpeg4_caps {
+        le32 mpeg4_params_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_MPEG4_PARAM_*) */
+        le32 mpeg4_profiles_bitmask; /* Bitmask of MASK(V4L2_MPEG_VIDEO_MPEG4_PROFILE_*) */
+        le32 mpeg4_levels_bitmask; /* Bitmask of MASK(V4L2_MPEG_VIDEO_MPEG4_LEVEL_*) */
+        u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{mpeg4_params_bitmask}]
+  is a bitmask of supported MPEG4 codec parameters.
+\item[\field{mpeg4_profiles_bitmask}]
+  is a bitmask of supported MPEG4 profiles used as bit numbers, see
+  \field{enum v4l2_mpeg_video_mpeg4_profile} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\item[\field{mpeg4_levels_bitmask}]
+  is a bitmask of supported MPEG4 levels used as bit numbers, see
+  \field{enum v4l2_mpeg_video_mpeg4_level} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\end{description}
+
+MPEG4 parameters are defined as follows:
+
+\begin{lstlisting}
+struct virtio_video_mpeg4_params {
+        le32 mpeg4_params_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_MPEG4_PARAM_*) */
+        le32 mpeg4_profile; /* V4L2_MPEG_VIDEO_MPEG4_PROFILE_* */
+        le32 mpeg4_level; /* V4L2_MPEG_VIDEO_MPEG4_LEVEL_* */
+        u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{mpeg4_params_bitmask}]
+  is a bitmask of supported MPEG4 codec parameters.
+\item[\field{mpeg4_profile}]
+  is one of the supported MPEG4 profiles, see
+  \field{enum v4l2_mpeg_video_mpeg4_profile} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\item[\field{mpeg4_level}]
+  is one of the supported MPEG4 levels, see
+  \field{enum v4l2_mpeg_video_mpeg4_level} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\end{description}
+
+\subsubsection{H.264}
+
+H.264 capabilities are defined as follows:
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_H264_PARAM_PROFILE  1  /* Same as V4L2_CID_MPEG_VIDEO_H264_PROFILE */
+#define VIRTIO_VIDEO_H264_PARAM_LEVEL    2  /* Same as V4L2_CID_MPEG_VIDEO_H264_LEVEL */
+
+struct virtio_video_h264_caps {
+        le32 h264_params_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_H264_PARAM_*) */
+        le32 h264_profiles_bitmask; /* Bitmask of MASK(V4L2_MPEG_VIDEO_H264_PROFILE_*) */
+        le32 h264_levels_bitmask; /* Bitmask of MASK(V4L2_MPEG_VIDEO_H264_LEVEL_*) */
+        u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{h264_params_bitmask}]
+  is a bitmask of supported H.264 codec parameters.
+\item[\field{h264_profiles_bitmask}]
+  is a bitmask of supported H.264 profiles used as bit numbers, see
+  \field{enum v4l2_mpeg_video_h264_profile} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\item[\field{h264_levels_bitmask}]
+  is a bitmask of supported H.264 levels used as bit numbers, see
+  \field{enum v4l2_mpeg_video_h264_level} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\end{description}
+
+H.264 parameters are defined as follows:
+
+\begin{lstlisting}
+struct virtio_video_h264_params {
+        le32 h264_params_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_H264_PARAM_*) */
+        le32 h264_profile; /* V4L2_MPEG_VIDEO_H264_PROFILE_* */
+        le32 h264_level; /* V4L2_MPEG_VIDEO_H264_LEVEL_* */
+        u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{h264_params_bitmask}]
+  is a bitmask of supported H.264 codec parameters.
+\item[\field{h264_profile}]
+  is one of the supported H.264 profiles, see
+  \field{enum v4l2_mpeg_video_h264_profile} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\item[\field{h264_level}]
+  is one of the supported H.264 levels, see
+  \field{enum v4l2_mpeg_video_h264_level} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\end{description}
+
+\subsubsection{HEVC}
+
+HEVC capabilities are defined as follows:
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_HEVC_PARAM_PROFILE  1  /* Same as V4L2_CID_MPEG_VIDEO_HEVC_PROFILE */
+#define VIRTIO_VIDEO_HEVC_PARAM_LEVEL    2  /* Same as V4L2_CID_MPEG_VIDEO_HEVC_LEVEL */
+
+struct virtio_video_hevc_caps {
+        le32 hevc_params_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_HEVC_PARAM_*) */
+        le32 hevc_profiles_bitmask; /* Bitmask of MASK(V4L2_MPEG_VIDEO_HEVC_PROFILE_*) */
+        le32 hevc_levels_bitmask; /* Bitmask of MASK(V4L2_MPEG_VIDEO_HEVC_LEVEL_*) */
+        u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{hevc_params_bitmask}]
+  is a bitmask of supported HEVC codec parameters.
+\item[\field{hevc_profiles_bitmask}]
+  is a bitmask of supported HEVC profiles used as bit numbers, see
+  \field{enum v4l2_mpeg_video_hevc_profile} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\item[\field{hevc_levels_bitmask}]
+  is a bitmask of supported HEVC levels used as bit numbers, see
+  \field{enum v4l2_mpeg_video_hevc_level} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\end{description}
+
+HEVC parameters are defined as follows:
+
+\begin{lstlisting}
+struct virtio_video_hevc_params {
+        le32 hevc_params_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_HEVC_PARAM_*) */
+        le32 hevc_profile; /* V4L2_MPEG_VIDEO_HEVC_PROFILE_* */
+        le32 hevc_level; /* V4L2_MPEG_VIDEO_HEVC_LEVEL_* */
+        u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{hevc_params_bitmask}]
+  is a bitmask of supported HEVC codec parameters.
+\item[\field{hevc_profile}]
+  is one of the supported HEVC profiles, see
+  \field{enum v4l2_mpeg_video_hevc_profile} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\item[\field{hevc_level}]
+  is one of the supported HEVC levels, see
+  \field{enum v4l2_mpeg_video_hevc_level} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\end{description}
+
+\subsubsection{VP8}
+
+VP8 capabilities are defined as follows:
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_VP8_PARAM_PROFILE  1  /* Same as V4L2_CID_MPEG_VIDEO_VP8_PROFILE */
+
+struct virtio_video_vp8_caps {
+        le32 vp8_params_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_VP8_PARAM_*) */
+        le32 vp8_profiles_bitmask; /* Bitmask of MASK(V4L2_MPEG_VIDEO_VP8_PROFILE_*) */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{vp8_params_bitmask}]
+  is a bitmask of supported VP8 codec parameters.
+\item[\field{vp8_profiles_bitmask}]
+  is a bitmask of supported VP8 profiles used as bit numbers, see
+  \field{enum v4l2_mpeg_video_vp8_profile} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\end{description}
+
+VP8 parameters are defined as follows:
+
+\begin{lstlisting}
+struct virtio_video_vp8_params {
+        le32 vp8_params_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_VP8_PARAM_*) */
+        le32 vp8_profile; /* V4L2_MPEG_VIDEO_VP8_PROFILE_* */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{vp8_params_bitmask}]
+  is a bitmask of supported VP8 codec parameters.
+\item[\field{vp8_profile}]
+  is one of the supported VP8 profiles, see
+  \field{enum v4l2_mpeg_video_vp8_profile} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\end{description}
+
+\subsubsection{VP9}
+
+VP9 capabilities are defined as follows:
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_VP9_PARAM_PROFILE  1  /* Same as V4L2_CID_MPEG_VIDEO_VP9_PROFILE */
+#define VIRTIO_VIDEO_VP9_PARAM_LEVEL    2  /* Same as V4L2_CID_MPEG_VIDEO_VP9_LEVEL */
+
+struct virtio_video_vp9_caps {
+        le32 vp9_params_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_VP9_PARAM_*) */
+        le32 vp9_profiles_bitmask; /* Bitmask of MASK(V4L2_MPEG_VIDEO_VP9_PROFILE_*) */
+        le32 vp9_levels_bitmask; /* Bitmask of MASK(V4L2_MPEG_VIDEO_VP9_LEVEL_*) */
+        u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{vp9_params_bitmask}]
+  is a bitmask of supported VP9 codec parameters.
+\item[\field{vp9_profiles_bitmask}]
+  is a bitmask of supported VP9 profiles used as bit numbers, see
+  \field{enum v4l2_mpeg_video_vp9_profile} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\item[\field{vp9_levels_bitmask}]
+  is a bitmask of supported VP9 levels used as bit numbers, see
+  \field{enum v4l2_mpeg_video_vp9_level} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\end{description}
+
+VP9 parameters are defined as follows:
+
+\begin{lstlisting}
+struct virtio_video_vp9_params {
+        le32 vp9_params_bitmask; /* Bitmask of MASK(VIRTIO_VIDEO_VP9_PARAM_*) */
+        le32 vp9_profile; /* V4L2_MPEG_VIDEO_VP9_PROFILE_* */
+        le32 vp9_level; /* V4L2_MPEG_VIDEO_VP9_LEVEL_* */
+        u8 padding[4];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{vp9_params_bitmask}]
+  is a bitmask of supported VP9 codec parameters.
+\item[\field{vp9_profile}]
+  is one of the supported VP9 profiles, see
+  \field{enum v4l2_mpeg_video_vp9_profile} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\item[\field{vp9_level}]
+  is one of the supported VP9 levels, see
+  \field{enum v4l2_mpeg_video_vp9_level} in
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\end{description}
diff --git a/device-types/video/device-conformance.tex b/device-types/video/device-conformance.tex
new file mode 100644
index 0000000..8aaf744
--- /dev/null
+++ b/device-types/video/device-conformance.tex
@@ -0,0 +1,22 @@
+\conformance{\subsection}{Video Device Conformance}
+\label{sec:Conformance / Device Conformance / Video Device Conformance}
+
+A video device MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{devicenormative:Device Types / Video Device / Feature bits}
+\item \ref{devicenormative:Device Types / Video Device / Device configuration layout}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueue}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Format dependencies}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Raw format capabilities}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Resource capabilities}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Bitrates}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_CREATE}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DESTROY}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DRAIN}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_RESET}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Resource Commands / VIRTIO_VIDEO_CMD_RESOURCE_ATTACH_BACKING}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Resource Commands / VIRTIO_VIDEO_CMD_RESOURCE_QUEUE}
+\end{itemize}
diff --git a/device-types/video/driver-conformance.tex b/device-types/video/driver-conformance.tex
new file mode 100644
index 0000000..1fe8473
--- /dev/null
+++ b/device-types/video/driver-conformance.tex
@@ -0,0 +1,16 @@
+\conformance{\subsection}{Video Driver Conformance}
+\label{sec:Conformance / Driver Conformance / Video Driver Conformance}
+
+A video driver MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{drivernormative:Device Types / Video Device / Feature bits}
+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueue}
+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}
+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DESTROY}
+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}
+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DRAIN}
+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_RESET}
+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Resource Commands / VIRTIO_VIDEO_CMD_RESOURCE_ATTACH_BACKING}
+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Resource Commands / VIRTIO_VIDEO_CMD_RESOURCE_QUEUE}
+\end{itemize}
diff --git a/introduction.tex b/introduction.tex
index b7155bf..b378883 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -101,6 +101,15 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:SEC1}\textbf{[SEC1]} &
     Standards for Efficient Cryptography Group(SECG), ``SEC1: Elliptic Cureve Cryptography'', Version 1.0, September 2000.
 	\newline\url{https://www.secg.org/sec1-v2.pdf}\\
+	\phantomsection\label{intro:V4L2}\textbf{[V4L2]} &
+	Linux V4L2 interface.
+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/videodev2.h}\\
+	\phantomsection\label{intro:V4L2 controls}\textbf{[V4L2 Controls]} &
+	Linux V4L2 controls definitions.
+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/v4l2-controls.h}\\
+	\phantomsection\label{intro:DRM formats}\textbf{[DRM Formats]} &
+	Linux DRM format definitions.
+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/drm/drm_fourcc.h}\\
 
 \end{longtable}
 
@@ -110,6 +119,18 @@ \section{Non-Normative References}
 	\phantomsection\label{intro:Virtio PCI Draft}\textbf{[Virtio PCI Draft]} &
 	Virtio PCI Draft Specification
 	\newline\url{http://ozlabs.org/~rusty/virtio-spec/virtio-0.9.5.pdf}\\
+	\phantomsection\label{intro:V4L2 compressed}\textbf{[V4L2 compressed formats]} &
+	Detailed descriptions of V4L2 compressed formats
+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst}\\
+	\phantomsection\label{intro:V4L2 RGB}\textbf{[V4L2 RGB formats]} &
+	Detailed descriptions of V4L2 RGB formats
+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst}\\
+	\phantomsection\label{intro:V4L2 YUV}\textbf{[V4L2 planar YUV formats]} &
+	Detailed descriptions of V4L2 planar YUV formats
+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst}\\
+	\phantomsection\label{intro:V4L2 codec controls}\textbf{[V4L2 codec controls]} &
+	Detailed descriptions of V4L2 controls
+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst}\\
 \end{longtable}
 
 \section{Terminology}\label{Terminology}
-- 
2.34.1

