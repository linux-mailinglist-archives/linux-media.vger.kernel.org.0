Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0276D2A07
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 23:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232973AbjCaVfI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 17:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbjCaVfH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 17:35:07 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B783120D9A
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 14:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1680298504; i=ps.report@gmx.net;
        bh=iW0T5BT7BblpskLAJZrB8GeGcLqNHbw25J4oVc85lJU=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=Z57s6mM2KgI/t3mF8sTKn7K1Pg6f6qH0Lqpq5E3gCSTYfthbzrZFymOwPlhNCORmT
         p/S3pkCXaLe2+oPpoht2aOTQyppV12P/XibsP69lCSeWwTetfe2hWbPcVifbPg+W8j
         FekTPAY255znKPIsj4UmT1dr2yoAmTyTL4vi+amNSwv8CS5Xw33CdLrZkTmqrzFqEm
         xuAZIVr/rAwCKRPRutj7lBRATEuazIWi2Coq/khxxWfQp80ZniXh9z2TWpqsECxtrm
         8u6wUa+xykaphV+K4/Dr3BaPlRtXdnN5FLpkUP4AyRP059aQrDJufsSWCeT6vkD7mU
         z4vFgU+a/UzFw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.135]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mv2xO-1qZE6J3zeq-00r2gR for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023
 23:35:04 +0200
From:   Peter Seiderer <ps.report@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1 2/2] libv4l1/libv4l2/v4l2-tracer: use common meson c_args/cpp_args to disable transparent large file support
Date:   Fri, 31 Mar 2023 23:35:03 +0200
Message-Id: <20230331213503.24082-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331213503.24082-1-ps.report@gmx.net>
References: <20230331213503.24082-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:axv893YlEAzi8NvllQC1N/rQ1xBdsFMvqcfhT5zLMEMnnXvrlL2
 0dzosCsBxIMa45UzA6n4LJNV63CKYTWqqwErsbQGzyPETa7cPmjgne2LnYrFgQp6Wnbc4el
 /1EX0Lc4AM2t0N6o2fbil0eurxYVHp6Qx0voI+tpkJRyQfy8pUVc62qXa9u8GdtliV/utcI
 c6QgiSxvEcek4yLbIbt6Q==
UI-OutboundReport: notjunk:1;M01:P0:RTgentn6KcM=;NPTSdfH+u+pV/zI0C0nMSVd2SYd
 iYapIDVz53HQwtpvh4PoUzr+hop7iXu+qUdzPlg22hD9SJxjH2So+fdvLNMlcdyI/Emlu3u9f
 L9nwNaMD3s82sbX1nBVDry/lqSh2RvoddwSvETMeMEulgBTmQBLHwUCTWoPqA8e8FgBgPgSOQ
 aRr0hISabeNdFb/p/Dcp4Dnkc1Pk8CJgo4vL/m8Bw0C1a8QYcLJkVOgf7srfyFBFNkw9WYu/+
 yrF6iWD19JcCtwNcR+gTGOlROdE4vugnZOUKl+n9ZSQQscwlSUKXJwwWsJzEeZgvQ9r5kzxmj
 oRkDtL2l+RsM5s+j97m3Ukd23G2c7gSv13V2ZcHZjX0pClbl1USvLydbWh4wbNgQx+q2dKec7
 uL4jCq9D7yt8tL/eqqnitsJjc6kGxRpuk1KR8fXTy+COz2N7XOQ6e7Poe3F/o105ZluxELjIW
 5lqLPc39iZvb6mhAi7SEIuw7tp81rXeJp2dFVG+VS/alnyUlum6G/8KHmam+tUgrRJQpsYID4
 zgR4RfzC3EZ21y+ELIf/UHIsL2lJtZcULshD8IxxVJ4BD9RDw3SDbfLOSxcss+YJFTqJ96edi
 4g35cghYyL3alto4ymTG4cG1Lxr1fJI3o3Df8sGanW/GcIr66pRyW93B2RcWMRsTad8khxyzF
 ERPXviatHzE8gls8spm4En+jN6Keye5fNOezFSfoasU9mg4MKvhz2/JlRyDBX2GwUDKwvJ3P0
 QZ9RwBzez7g/oDlQW4XCOa0HAEhEFa6yYfEk1JPj4DahUeX4P2++/zSCMN+sMbEQc97zl0/UK
 ybyAUOORHSXvIqjG37wM301DuBV67QhH7pOj69K8HCxI/Dpj5pmnWV0nOyOaeAXDO9c+ibAmg
 PYBR4fTMM9rQ66I1NsG0mk3jiUXuEA8Aqv714xBfF2pb+Wi8L/VUuI/tJvFODsuuH8/6Ih1SV
 khTTVA==
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MIME_BASE64_TEXT,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VXNlIGNvbW1vbiBtZXNvbiBjX2FyZ3MvY3BwX2FyZ3MgdG8gZGlzYWJsZSB0cmFuc3BhcmVudCBs
YXJnZQpmaWxlIHN1cHBvcnQgZm9yIHRoZSB3cmFwcGVycyBhcyBhbHJlYWR5IGRvbmUgaW4gdXRp
bHMvdjRsMi10cmFjZXIKZm9yIGxpYi9saWJ2NGwxL3Y0bDFjb21wYXQuYyBhbmQgbGliL2xpYnY0
bDIvdjRsMmNvbnZlcnQuYyB0b28uCgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMu
cmVwb3J0QGdteC5uZXQ+Ci0tLQogbGliL2xpYnY0bDEvbWVzb24uYnVpbGQgICAgICAgfCAgMSAr
CiBsaWIvbGlidjRsMS92NGwxY29tcGF0LmMgICAgICB8ICA1IC0tLS0tCiBsaWIvbGlidjRsMi9t
ZXNvbi5idWlsZCAgICAgICB8ICAxICsKIGxpYi9saWJ2NGwyL3Y0bDJjb252ZXJ0LmMgICAgIHwg
IDUgLS0tLS0KIG1lc29uLmJ1aWxkICAgICAgICAgICAgICAgICAgIHwgMTAgKysrKysrKysrKwog
dXRpbHMvdjRsMi10cmFjZXIvbWVzb24uYnVpbGQgfCAxMyArLS0tLS0tLS0tLS0tCiA2IGZpbGVz
IGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2xpYi9saWJ2NGwxL21lc29uLmJ1aWxkIGIvbGliL2xpYnY0bDEvbWVzb24uYnVpbGQKaW5kZXgg
ZTFkZjJmYTIuLmUxZmJhMzQ2IDEwMDY0NAotLS0gYS9saWIvbGlidjRsMS9tZXNvbi5idWlsZAor
KysgYi9saWIvbGlidjRsMS9tZXNvbi5idWlsZApAQCAtNjAsNSArNjAsNiBAQCB2NGwxY29tcGF0
ID0gc2hhcmVkX21vZHVsZSgndjRsMWNvbXBhdCcsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBuYW1lX3ByZWZpeCA6ICcnLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5zdGFsbCA6
IHRydWUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnN0YWxsX2RpciA6IGxpYnY0bDFw
cml2ZGlyLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgY19hcmdzIDogdjRsMl93cmFwcGVy
X2FyZ3MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXBlbmRlbmNpZXMgOiB2NGwxY29t
cGF0X2RlcHMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbmNsdWRlX2RpcmVjdG9yaWVz
IDogdjRsMl91dGlsc19pbmNkaXIpCmRpZmYgLS1naXQgYS9saWIvbGlidjRsMS92NGwxY29tcGF0
LmMgYi9saWIvbGlidjRsMS92NGwxY29tcGF0LmMKaW5kZXggNzA1ZDdkNGIuLjJkYjY4NDIzIDEw
MDY0NAotLS0gYS9saWIvbGlidjRsMS92NGwxY29tcGF0LmMKKysrIGIvbGliL2xpYnY0bDEvdjRs
MWNvbXBhdC5jCkBAIC0xOSwxMSArMTksNiBAQAogIyBGb3VuZGF0aW9uLCBJbmMuLCA1MSBGcmFu
a2xpbiBTdHJlZXQsIFN1aXRlIDUwMCwgQm9zdG9uLCBNQSAgMDIxMTAtMTMzNSAgVVNBCiAgKi8K
IAotLyogZW5zdXJlIHdlIHNlZSAqNjQgdmFyaWFudHMgYW5kIHRoZXkgYXJlbid0IHRyYW5zcGFy
ZW50bHkgdXNlZCAqLwotI3VuZGVmIF9MQVJHRUZJTEVfU09VUkNFCi0jdW5kZWYgX0ZJTEVfT0ZG
U0VUX0JJVFMKLSNkZWZpbmUgX0xBUkdFRklMRTY0X1NPVVJDRSAxCi0KICNpbmNsdWRlIDxzdGRs
aWIuaD4KICNpbmNsdWRlIDxzdGRhcmcuaD4KICNpbmNsdWRlIDxmY250bC5oPgpkaWZmIC0tZ2l0
IGEvbGliL2xpYnY0bDIvbWVzb24uYnVpbGQgYi9saWIvbGlidjRsMi9tZXNvbi5idWlsZAppbmRl
eCBiZDZlMGU3Zi4uOWQ2ZWNkNWYgMTAwNjQ0Ci0tLSBhL2xpYi9saWJ2NGwyL21lc29uLmJ1aWxk
CisrKyBiL2xpYi9saWJ2NGwyL21lc29uLmJ1aWxkCkBAIC02OSw1ICs2OSw2IEBAIHY0bDJjb252
ZXJ0ID0gc2hhcmVkX21vZHVsZSgndjRsMmNvbnZlcnQnLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG5hbWVfcHJlZml4IDogJycsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5z
dGFsbCA6IHRydWUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5zdGFsbF9kaXIgOiBs
aWJ2NGwycHJpdmRpciwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBjX2FyZ3MgOiB2NGwy
X3dyYXBwZXJfYXJncywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXBlbmRlbmNpZXMg
OiB2NGwyY29udmVydF9kZXBzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluY2x1ZGVf
ZGlyZWN0b3JpZXMgOiB2NGwyX3V0aWxzX2luY2RpcikKZGlmZiAtLWdpdCBhL2xpYi9saWJ2NGwy
L3Y0bDJjb252ZXJ0LmMgYi9saWIvbGlidjRsMi92NGwyY29udmVydC5jCmluZGV4IDk3YmVkOWE5
Li4zOTZlZDNlYSAxMDA2NDQKLS0tIGEvbGliL2xpYnY0bDIvdjRsMmNvbnZlcnQuYworKysgYi9s
aWIvbGlidjRsMi92NGwyY29udmVydC5jCkBAIC0yMywxMSArMjMsNiBAQAogLyogcHJldmVudCBH
Q0MgNC43IGlubGluaW5nIGVycm9yICovCiAjdW5kZWYgX0ZPUlRJRllfU09VUkNFCiAKLS8qIGVu
c3VyZSB3ZSBzZWUgKjY0IHZhcmlhbnRzIGFuZCB0aGV5IGFyZW4ndCB0cmFuc3BhcmVudGx5IHVz
ZWQgKi8KLSN1bmRlZiBfTEFSR0VGSUxFX1NPVVJDRQotI3VuZGVmIF9GSUxFX09GRlNFVF9CSVRT
Ci0jZGVmaW5lIF9MQVJHRUZJTEU2NF9TT1VSQ0UgMQotCiAjaW5jbHVkZSA8c3RkYXJnLmg+CiAj
aW5jbHVkZSA8c3RkbGliLmg+CiAjaW5jbHVkZSA8ZmNudGwuaD4KZGlmZiAtLWdpdCBhL21lc29u
LmJ1aWxkIGIvbWVzb24uYnVpbGQKaW5kZXggMWU3NmIwZjQuLjc1Mzk4OTE3IDEwMDY0NAotLS0g
YS9tZXNvbi5idWlsZAorKysgYi9tZXNvbi5idWlsZApAQCAtNDcsNiArNDcsMTYgQEAgY29tbW9u
X2FyZ3VtZW50cyA9IFsKICAgICAnLWluY2x1ZGUnLCBtZXNvbi5jdXJyZW50X2J1aWxkX2Rpcigp
IC8gJ2NvbmZpZy5oJywKIF0KIAordjRsMl93cmFwcGVyX2FyZ3MgPSBbCisgICAgIyBBcyB0aGUg
bGlicmFyeSBuZWVkcyB0byBwcm92aWRlIGJvdGggMzItYml0IGFuZCA2NC1iaXQgdmVyc2lvbnMK
KyAgICAjIG9mIGZpbGUgb3BlcmF0aW9ucywgZGlzYWJsZSB0cmFuc3BhcmVudCBsYXJnZSBmaWxl
IHN1cHBvcnQgKGZpeGVzCisgICAgIyAnRXJyb3I6IHN5bWJvbCBgb3BlbjY0L21tYXA2NCcgaXMg
YWxyZWFkeSBkZWZpbmVkJyBjb21waWxlIGZhaWx1cmUKKyAgICAjIG90aGVyd2lzZSkKKyAgICAn
LVVfRklMRV9PRkZTRVRfQklUUycsCisgICAgJy1EX0ZJTEVfT0ZGU0VUX0JJVFM9MzInLAorICAg
ICctRF9MQVJHRUZJTEU2NF9TT1VSQ0UnLAorXQorCiB2NGwyX3V0aWxzX2luY2Rpcl9hcnIgPSBb
CiAgICAgJ2xpYicgLyAnaW5jbHVkZScsCiBdCmRpZmYgLS1naXQgYS91dGlscy92NGwyLXRyYWNl
ci9tZXNvbi5idWlsZCBiL3V0aWxzL3Y0bDItdHJhY2VyL21lc29uLmJ1aWxkCmluZGV4IGVkMmMx
ZGY4Li40N2MwYTFmNiAxMDA2NDQKLS0tIGEvdXRpbHMvdjRsMi10cmFjZXIvbWVzb24uYnVpbGQK
KysrIGIvdXRpbHMvdjRsMi10cmFjZXIvbWVzb24uYnVpbGQKQEAgLTcwLDIxICs3MCwxMCBAQCBs
aWJ2NGwyX3RyYWNlcl9pbmNkaXIgPSBbCiAgICAgdjRsMl91dGlsc19pbmNkaXIsCiBdCiAKLWxp
YnY0bDJfdHJhY2VyX2NwcF9hcmdzID0gWwotICAgICMgTWVzb24gZW5hYmxlcyBsYXJnZSBmaWxl
IHN1cHBvcnQgdW5jb25kaXRpb25hbGx5LCB3aGljaCByZWRpcmVjdHMgZmlsZQotICAgICMgb3Bl
cmF0aW9ucyB0byA2NC1iaXQgdmVyc2lvbnMuIFRoaXMgcmVzdWx0cyBpbiBzb21lIHN5bWJvbHMg
YmVpbmcKLSAgICAjIHJlbmFtZWQsIGZvciBpbnN0YW5jZSBvcGVuKCkgYmVpbmcgcmVuYW1lZCB0
byBvcGVuNjQoKS4gQXMgdGhlIGxpYnJhcnkKLSAgICAjIG5lZWRzIHRvIHByb3ZpZGUgYm90aCAz
Mi1iaXQgYW5kIDY0LWJpdCB2ZXJzaW9ucyBvZiBmaWxlIG9wZXJhdGlvbnMsCi0gICAgIyBkaXNh
YmxlIHRyYW5zcGFyZW50IGxhcmdlIGZpbGUgc3VwcG9ydC4KLSAgICAnLVVfRklMRV9PRkZTRVRf
QklUUycsCi0gICAgJy1EX0ZJTEVfT0ZGU0VUX0JJVFM9MzInLAotICAgICctRF9MQVJHRUZJTEU2
NF9TT1VSQ0UnLAotXQotCiBsaWJ2NGwydHJhY2VyID0gc2hhcmVkX21vZHVsZSgndjRsMnRyYWNl
cicsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ2NGwydHJhY2VyX3NvdXJjZXMs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnN0YWxsIDogdHJ1ZSwKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNwcF9hcmdzIDogbGlidjRsMl90cmFjZXJfY3BwX2FyZ3Ms
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjcHBfYXJncyA6IHY0bDJfd3JhcHBlcl9h
cmdzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGVwZW5kZW5jaWVzIDogbGlidjRs
MnRyYWNlcl9kZXBzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5jbHVkZV9kaXJl
Y3RvcmllcyA6IGxpYnY0bDJfdHJhY2VyX2luY2RpcikKIAotLSAKMi40MC4wCgo=
