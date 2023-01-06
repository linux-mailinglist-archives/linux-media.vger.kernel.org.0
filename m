Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED94660A19
	for <lists+linux-media@lfdr.de>; Sat,  7 Jan 2023 00:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbjAFXKz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 18:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjAFXKw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 18:10:52 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E4FD687BD
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 15:10:51 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id qk9so6805803ejc.3
        for <linux-media@vger.kernel.org>; Fri, 06 Jan 2023 15:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:message-id:date:content-transfer-encoding:references
         :in-reply-to:subject:from:cc:to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBJRzSx8sh0EAMS5a3epzhJu7mWg6Dh0mbH3noFr6XM=;
        b=efGTEbzGgujmNvxtq1ctn7l7vJuMJZANXFPbik6YiIQ2RVRt7bIMeCMDMSewBt/VJ1
         U4BhNPhy4kQ/WPQf3aKiwjJdjmtmXcrbLMuRLEYzVfCwweKAYAYDWnK/RHeY0JLBgYYG
         jqcSUCuGJ5pH4jn/P5QsyntNL2Xza93dmXydWhJlqaOYp6YAfCS1DpZ4HxV9fdxiNT/X
         7PMzL0mPqW93+oL5RgxyXD7DAlL1U//4ULHU3Gtb1LrpTbXe01slWiMv5I5BtLiaHElJ
         wbkmqKcZvW7q+yqG6IUEIqsy2f5nfiwLIyewHXpSFA77GzpPPmIPnTcZ5tt2NQnZrdfn
         RABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:content-transfer-encoding:references
         :in-reply-to:subject:from:cc:to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBJRzSx8sh0EAMS5a3epzhJu7mWg6Dh0mbH3noFr6XM=;
        b=fTDiB+u1csyxemyWyOkR7U+4T4RIqdN/hQkBJG/UlejqFzmz/R6HBvoZh476Vhw74a
         3J3yakIUf+HP7QyfC98o0XeFy3Roggt139TK7Rlf1ZMDio6uhiKfbWe8XCwKK3oBNEuK
         4mKyCNDApdH0EX0cLV1gswMEeKh5DpKGQ+CX7YjfDbEokZckVS/EqHiN+tVrwuHqNSbR
         OG9GmfR+hUul6BL8ODyqEYCxx5isF55LuAZLzqit/wtEimshR4WR33DJiBH3+cYd8pm0
         PxBuXFO+AZ7IYa3/Bp57WgttoRucaScVvrDG1FDMJak+aNO+ESAsT3dVkq08Akf954gg
         QixA==
X-Gm-Message-State: AFqh2kr6uiQ3YWeH+WG6yGYB6zwpddC11loddhCtTJZ768vfdX4XcBsF
        Ko/NFL79ntVGuR5q1HdA0/Q=
X-Google-Smtp-Source: AMrXdXtkaErnolaExZQuqEFSBEkxpvvIH0JeDqbpgPFPuRfXQYg0bccY4jdht1LNoQrnbXhzpoF/uA==
X-Received: by 2002:a17:907:a789:b0:7c0:bbab:22e5 with SMTP id vx9-20020a170907a78900b007c0bbab22e5mr51930077ejc.16.1673046650153;
        Fri, 06 Jan 2023 15:10:50 -0800 (PST)
Received: from [100.68.188.119] (92.40.193.218.threembb.co.uk. [92.40.193.218])
        by smtp.gmail.com with ESMTPSA id y16-20020a1709063a9000b0084ce5d5d21bsm832466ejd.22.2023.01.06.15.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 15:10:49 -0800 (PST)
X-Priority: 3
To:     adam@piggz.co.uk, linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, linux-sunxi@lists.linux.dev,
        paul.kocialkowski@bootlin.com, laurent.pinchart@ideasonboard.com,
        adam@piggz.co.uk, yong.deng@magewell.com
From:   piggz1@gmail.com
Subject: Re: [PATCH 0/3] suns6-csi changes to support libcamera
In-Reply-To: <20230106194038.16018-1-adam@piggz.co.uk>
References: <20230106194038.16018-1-adam@piggz.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Date:   Fri, 6 Jan 2023 23:10:46 +0000
Message-ID: <ig7fmi.ro3721.rtjy47-qmf@smtp.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QXBvbG9naWVzLCBhY2NpZGVudGFsbHkgc2VudCB0aGlzIHNldCB0d2ljZS4gIHBsZWFzZSBpZ25v
cmUgdGhpcyBzZXQuDQoNCkFkYW0NCg0KT24gRnJpZGF5LCA2IEphbnVhcnkgMjAyMywgYWRhbUBw
aWdnei5jby51ayB3cm90ZToNCj4gRnJvbTogQWRhbSBQaWdnIDxhZGFtQHBpZ2d6LmNvLnVrPg0K
PiANCj4gVGhpcyAzIHBhdGNoIHNldCBhZGRzIFY0TDJfQ0FQX0lPX01DIGFuZCB2aWRpb2NfZW51
bV9mcmFtZXNpemVzIHN1cHBvcnQNCj4gdG8gdGhlIHN1bjZpLWNzaSBkcml2ZXIsIGFsbG93aW5n
IHRoZSBQaW5lcGhvbmUgcmVhciBjYW1lcmEgKG92NTY0MCkgdG8NCj4gYmUgc3VwcG9ydGVkLg0K
PiANCj4gVGhlc2UgaGF2ZSBiZWVuIGRldmVsb3BlZCB3aXRoIHRoZSBndWlkYW5jZSBvZiBMYXVy
ZW50IFBpbmNoYXJ0LCBhbmQNCj4gYmVlbiB0ZXN0ZWQgYnkgY2FwdHVyaW5nIGZyYW1lcyBmcm9t
IHRoZSBsaWJjYW1lcmEgY2FtIHV0aWxpdHkuDQo+IA0KPiBJbiBhZGRpdGlvbiB0byB0aGVzZSwg
YSBwYXRjaCB0byBjaGFuZ2UgdGhlIHY0bCBnYWluIG1vZGUgaW4gdGhlIG92NTY0MA0KPiBkcml2
ZXIsIGFuZCB0aGUgMiBmb3JtYXQgcHJvcGFnYXRpb24gcGF0Y2hlcyBhbGwgYnkgTGF1cm5ldCBh
cmUNCj4gcmVxdWlyZWQuDQo+IA0KPiBBZGFtIFBpZ2cgKDMpOg0KPiAgIG1lZGlhOiBzdW42aS1j
c2k6IG1lcmdlIHN1bjZpX2NzaV9mb3JtYXRzIGFuZCBzdW42aV9jc2lfZm9ybWF0c19tYXRjaA0K
PiAgIG1lZGlhOiBzdW42aS1jc2k6IGltcGxlbWVudCBWNEwyX0NBUF9JT19NQw0KPiAgIG1lZGlh
OiBzdW42aS1jc2k6IGltcGxlbWVudCB2aWRpb2NfZW51bV9mcmFtZXNpemVzDQo+IA0KPiAgLi4u
L3N1bnhpL3N1bjZpLWNzaS9zdW42aV9jc2lfY2FwdHVyZS5jICAgICAgIHwgMjE1ICsrKysrKysr
Ky0tLS0tLS0tLQ0KPiAgLi4uL3N1bnhpL3N1bjZpLWNzaS9zdW42aV9jc2lfY2FwdHVyZS5oICAg
ICAgIHwgICA2ICstDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEwMyBpbnNlcnRpb25zKCspLCAxMTgg
ZGVsZXRpb25zKC0pDQo+IA0KPiAtLSANCj4gMi4zOS4wDQo+IA0KPg0KDQotLSANClNlbnQgZnJv
bSBteSBTYWlsZmlzaCBkZXZpY2U=
