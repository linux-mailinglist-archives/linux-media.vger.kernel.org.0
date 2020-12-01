Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 771492CA9A6
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 18:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390002AbgLAR3W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 12:29:22 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:45025 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389968AbgLAR3V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 12:29:21 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 1D898F1C
        for <linux-media@vger.kernel.org>; Tue,  1 Dec 2020 12:28:16 -0500 (EST)
Received: from imap21 ([10.202.2.71])
  by compute4.internal (MEProxy); Tue, 01 Dec 2020 12:28:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm3; bh=uLPsacDJ/CAKtQBDu3TxsgEuyEFW6uAP+iRgC+LkCSQ=; b=R69dfsvn
        y9utmhgfsPhHOJVuY4/c2so5GVHj3VdrXLMSh0LlUVKToSXDMDr4JYWf7QgrFXdF
        hK3MssZdr/n2oP8NZVFbRM4YDohUQjdPhUYIxEE9ra91XLeGGFggMZLlIRQ96550
        R3+Owrvs9hci6ABZxt/TmM7zSBMcT7UBlmhIeS8XNXfSeaCzHqJ8jlVIbiEKnOgj
        HTFSMYy36n4EX0OCW252xpplFOZEhtZrZIdbQhhGN2uoUx5NByX6t1+DMiDFyu6G
        E4rcfh5LkuXLfwNLIhpJeL6CxOy9grJ0gveIUNi78NoNhGeLeNtioolR5xTSs19p
        SDQ3HCadRzKvjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=uLPsacDJ/CAKtQBDu3TxsgEuyEFW6
        uAP+iRgC+LkCSQ=; b=LkD7AQ8A6yhzryMMRfv4JOvVTphQt/6LoaUGfWfuLCcmw
        4/2BUpZssdFcb+rz6K3zyQhFRMJwrMfOytm1dR1VnXDadCUREtbhxAB1MlnGOb8K
        eSX4kNJHutSS4IqAyLP1AsPdUz72lF+tTivm4NvqCIYU3HIgp/ASdWcYGh6tUcDs
        6wd1IMa4p2067k1oLuzAvkV9Olsc9w2FhUd/fWmARW/73Fpb9om+bTU/OsNuTpft
        dhKH5nBhf7wO/Sg4yLuLzDktAYBECqVhnyfzynuqiQOLlc1yTzfQig1dNMd59t9C
        Up9e5Z8b7KkfiigcPIxccB91I18yiMprMF5wXtubg==
X-ME-Sender: <xms:L33GX7DNRf3rA_qFzrGXcma_W0hPwa27YwAUFCHS0tkplG3NHS2TMQ>
    <xme:L33GXxjQuhMVM5Cv3l7_kIfxbUREXr701rMttZdFwKNJZAn57CLh6LCDr2gJk8dVa
    1232w1H4OOAVXUD5Qs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtre
    dtreertdenucfhrhhomhepfdfuihguucfuphhrhidfuceoshhiugesrggvrghmrdhusheq
    necuggftrfgrthhtvghrnhepueekheeiueeugeevvdejhfeiuefgvdekvdduvdegudfghe
    efvedtgeetvdehudetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepshhiugesrggvrghmrdhush
X-ME-Proxy: <xmx:L33GX2mCANusmx1zrY6cWZu31hfT1tFmsxZUtMoSwbbSR2hiW7-JEA>
    <xmx:L33GX9xIEUBmc4la-97FzWl2cU6V_whamuLCCL599i7gigQVWH-28A>
    <xmx:L33GXwRy5f36OC3IZfggEM42mY9Y8CfvzfRVYG9Rb4kwtt5jZlgqmQ>
    <xmx:L33GX3c-gJemdwLpES6rAIxGtlj9k4mgUmkbLmJSt5v0w9dKoT7v3w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 02FD86F6005F; Tue,  1 Dec 2020 12:28:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-622-g4a97c0b-fm-20201115.001-g4a97c0b3
Mime-Version: 1.0
Message-Id: <e692d867-54f1-4987-917c-1b0d39cf7ab3@www.fastmail.com>
Date:   Tue, 01 Dec 2020 11:27:54 -0600
From:   "Sid Spry" <sid@aeam.us>
To:     linux-media@vger.kernel.org
Subject: Accelerated Video Capture on ARM
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I know this may depend on specific GPU core, but is there a way to
do a screen capture? The usecase is capturing the video from an Android
device, but a voiding the limited and poorly performing developer-oriented
methods.

Thanks.
