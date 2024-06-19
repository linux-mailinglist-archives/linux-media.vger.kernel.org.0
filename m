Return-Path: <linux-media+bounces-13699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6467590EE8C
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 15:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFA7C1F215DB
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 13:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170E514F9F8;
	Wed, 19 Jun 2024 13:29:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp2c.hosting90.cz (smtp2c.hosting90.cz [130.193.12.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756A8147C6E
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 13:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.193.12.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718803763; cv=none; b=ojk+0fZqxsWsEHKttbG6Iwf/rEP+eahukyUL1Bbb0fvI+MgcgqXcTKegAYIjMvYjL35o4svIW5T+5PgdygeZx7wxLAqkScfZdfxFtvszK2/6dwEEf9ZJyYN1fVRhfaST79EufsUAykhhcIkYwlXIoLnK9gqdIABtfwHTA2lH66M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718803763; c=relaxed/simple;
	bh=X90c3INjkoF/YP1eYr3bmpDFbFs1i6pao90jA8KsZC4=;
	h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type; b=cTCkKOeoa4Ftjv5FiNprD/O5dlE0r7kBFS9iyXIX6sjZ8RV16y833k1K6QUuqeMup6P4hCY0pj/Cz36Z0FypV2ELQGP+BH22bCkDFcMcmpy8wMdUGfy802RokH8q25Pqx24OTTjy7cGe7jRI8ALGbQyNuyJVUu/Dd02xJwXFjLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=valek.net; spf=pass smtp.mailfrom=tutr.cz; arc=none smtp.client-ip=130.193.12.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=valek.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tutr.cz
Received: from 88-102-246-26.rch.o2.cz ([88.102.246.26] helo=[192.168.200.17])
	by smtp2.hosting90.cz with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94)
	(envelope-from <tutr@tutr.cz>)
	id 1sJvG2-0001Z6-9j
	for linux-media@vger.kernel.org; Wed, 19 Jun 2024 15:21:50 +0200
From: =?UTF-8?B?T25kxZllaiBWw6FsZWs=?= <ondrej@valek.net>
Subject: Updated DVB scan tables for cz-All
To: linux-media@vger.kernel.org
Message-ID: <846e7968-292d-5e96-b2a4-1e2e6b131fe3@tutr.cz>
Date: Wed, 19 Jun 2024 15:21:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------E54D23702A4E9BB21535740A"
Content-Language: cs
X-Antivirus: Clamav/CLEAN
X-Scan-Signature: 0cc0cc2392a151b0b817c14764c8f447
X-Authenticated-Id: tutr@tutr.cz

This is a multi-part message in MIME format.
--------------E54D23702A4E9BB21535740A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,
I'm sending updated version of DVB-T scan tables for Czech Republic 
(according to instructions at 
https://git.linuxtv.org/dtv-scan-tables.git/about/)

It has been some years already that we have only DVB-T2 (no analog, no 
DVB-T), so the scan tables do not work at all and it has to be set up 
manually.

The file in the attachment therefore replaces whole file 
https://git.linuxtv.org/dtv-scan-tables.git/tree/dvb-t/cz-All .

Please let me know if the file format is ok.

Thank you.

Ondřej Válek,
Czechia



--------------E54D23702A4E9BB21535740A
Content-Type: text/plain; charset=UTF-8;
 name="cz-All"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="cz-All"

IyBDemVjaCBSZXB1YmxpYywgd2hvbGUgY291bnRyeSAodXBkYXRlZCB0byByZWd1bGF0b3J5
IE1heSAyMDIyKSAtIERWQlQyIGNoYW5uZWxzIDIxLTQ4ICg0NzQtNjkwIE1IeikKIyBTb3Vy
Y2U6IGh0dHBzOi8vc3Bla3RydW0uY3R1Lmdvdi5jei9lbi9iYW5kLzQ3MC02OTQtbWh6CiMg
U291cmNlOiBodHRwczovL2N0dS5nb3YuY3ovc2l0ZXMvZGVmYXVsdC9maWxlcy9vYnNhaC9j
dHUvc2RlbGVuaS1vLXZ5ZGFuaS1vcGF0cmVuaS1vYmVjbmUtcG92YWh5LWNhc3RpLXBsYW51
LXZ5dXppdGktcmFkaW92ZWhvLXNwZWt0cmEtYy5wdi1wLzEwLzA1LjIwMjItNC1wcm8ta21p
dG9jdG92ZS1wYXNtby00NzAtOTYwLW1oei9vYnJhemt5LzIwMjJwdnJzMTBwb2tvcjJwLnBk
ZgojIE92ZXJ2aWV3IG9mIGluZGl2aWR1YWwgbGljZW5jZXMgKGN1cnJlbnQgVFYtdHJhbnNt
aXR0ZXJzKTogaHR0cHM6Ly93d3cuY3R1LmN6L3Z5aGxlZGF2YWNpLWRhdGFiYXplL3ByZWhs
ZWQtdGVsZXZpem5pY2gtdnlzaWxhY3Uvb3ByYXZuZW5pCgpbQ0hBTk5FTF0KICAgICAgICBE
RUxJVkVSWV9TWVNURU0gPSBEVkJUMgogICAgICAgIEZSRVFVRU5DWSA9IDQ3NDAwMDAwMAog
ICAgICAgIEJBTkRXSURUSF9IWiA9IDgwMDAwMDAKCltDSEFOTkVMXQogICAgICAgIERFTElW
RVJZX1NZU1RFTSA9IERWQlQyCiAgICAgICAgRlJFUVVFTkNZID0gNDgyMDAwMDAwCiAgICAg
ICAgQkFORFdJRFRIX0haID0gODAwMDAwMAoKW0NIQU5ORUxdCiAgICAgICAgREVMSVZFUllf
U1lTVEVNID0gRFZCVDIKICAgICAgICBGUkVRVUVOQ1kgPSA0OTAwMDAwMDAKICAgICAgICBC
QU5EV0lEVEhfSFogPSA4MDAwMDAwCgpbQ0hBTk5FTF0KICAgICAgICBERUxJVkVSWV9TWVNU
RU0gPSBEVkJUMgogICAgICAgIEZSRVFVRU5DWSA9IDQ5ODAwMDAwMAogICAgICAgIEJBTkRX
SURUSF9IWiA9IDgwMDAwMDAKCltDSEFOTkVMXQogICAgICAgIERFTElWRVJZX1NZU1RFTSA9
IERWQlQyCiAgICAgICAgRlJFUVVFTkNZID0gNTA2MDAwMDAwCiAgICAgICAgQkFORFdJRFRI
X0haID0gODAwMDAwMAoKW0NIQU5ORUxdCiAgICAgICAgREVMSVZFUllfU1lTVEVNID0gRFZC
VDIKICAgICAgICBGUkVRVUVOQ1kgPSA1MTQwMDAwMDAKICAgICAgICBCQU5EV0lEVEhfSFog
PSA4MDAwMDAwCgpbQ0hBTk5FTF0KICAgICAgICBERUxJVkVSWV9TWVNURU0gPSBEVkJUMgog
ICAgICAgIEZSRVFVRU5DWSA9IDUyMjAwMDAwMAogICAgICAgIEJBTkRXSURUSF9IWiA9IDgw
MDAwMDAKCltDSEFOTkVMXQogICAgICAgIERFTElWRVJZX1NZU1RFTSA9IERWQlQyCiAgICAg
ICAgRlJFUVVFTkNZID0gNTMwMDAwMDAwCiAgICAgICAgQkFORFdJRFRIX0haID0gODAwMDAw
MAoKW0NIQU5ORUxdCiAgICAgICAgREVMSVZFUllfU1lTVEVNID0gRFZCVDIKICAgICAgICBG
UkVRVUVOQ1kgPSA1MzgwMDAwMDAKICAgICAgICBCQU5EV0lEVEhfSFogPSA4MDAwMDAwCgpb
Q0hBTk5FTF0KICAgICAgICBERUxJVkVSWV9TWVNURU0gPSBEVkJUMgogICAgICAgIEZSRVFV
RU5DWSA9IDU0NjAwMDAwMAogICAgICAgIEJBTkRXSURUSF9IWiA9IDgwMDAwMDAKCltDSEFO
TkVMXQogICAgICAgIERFTElWRVJZX1NZU1RFTSA9IERWQlQyCiAgICAgICAgRlJFUVVFTkNZ
ID0gNTU0MDAwMDAwCiAgICAgICAgQkFORFdJRFRIX0haID0gODAwMDAwMAoKW0NIQU5ORUxd
CiAgICAgICAgREVMSVZFUllfU1lTVEVNID0gRFZCVDIKICAgICAgICBGUkVRVUVOQ1kgPSA1
NjIwMDAwMDAKICAgICAgICBCQU5EV0lEVEhfSFogPSA4MDAwMDAwCgpbQ0hBTk5FTF0KICAg
ICAgICBERUxJVkVSWV9TWVNURU0gPSBEVkJUMgogICAgICAgIEZSRVFVRU5DWSA9IDU3MDAw
MDAwMAogICAgICAgIEJBTkRXSURUSF9IWiA9IDgwMDAwMDAKCltDSEFOTkVMXQogICAgICAg
IERFTElWRVJZX1NZU1RFTSA9IERWQlQyCiAgICAgICAgRlJFUVVFTkNZID0gNTc4MDAwMDAw
CiAgICAgICAgQkFORFdJRFRIX0haID0gODAwMDAwMAoKW0NIQU5ORUxdCiAgICAgICAgREVM
SVZFUllfU1lTVEVNID0gRFZCVDIKICAgICAgICBGUkVRVUVOQ1kgPSA1ODYwMDAwMDAKICAg
ICAgICBCQU5EV0lEVEhfSFogPSA4MDAwMDAwCgpbQ0hBTk5FTF0KICAgICAgICBERUxJVkVS
WV9TWVNURU0gPSBEVkJUMgogICAgICAgIEZSRVFVRU5DWSA9IDU5NDAwMDAwMAogICAgICAg
IEJBTkRXSURUSF9IWiA9IDgwMDAwMDAKCltDSEFOTkVMXQogICAgICAgIERFTElWRVJZX1NZ
U1RFTSA9IERWQlQyCiAgICAgICAgRlJFUVVFTkNZID0gNjAyMDAwMDAwCiAgICAgICAgQkFO
RFdJRFRIX0haID0gODAwMDAwMAoKW0NIQU5ORUxdCiAgICAgICAgREVMSVZFUllfU1lTVEVN
ID0gRFZCVDIKICAgICAgICBGUkVRVUVOQ1kgPSA2MTAwMDAwMDAKICAgICAgICBCQU5EV0lE
VEhfSFogPSA4MDAwMDAwCgpbQ0hBTk5FTF0KICAgICAgICBERUxJVkVSWV9TWVNURU0gPSBE
VkJUMgogICAgICAgIEZSRVFVRU5DWSA9IDYxODAwMDAwMAogICAgICAgIEJBTkRXSURUSF9I
WiA9IDgwMDAwMDAKCltDSEFOTkVMXQogICAgICAgIERFTElWRVJZX1NZU1RFTSA9IERWQlQy
CiAgICAgICAgRlJFUVVFTkNZID0gNjI2MDAwMDAwCiAgICAgICAgQkFORFdJRFRIX0haID0g
ODAwMDAwMAoKW0NIQU5ORUxdCiAgICAgICAgREVMSVZFUllfU1lTVEVNID0gRFZCVDIKICAg
ICAgICBGUkVRVUVOQ1kgPSA2MzQwMDAwMDAKICAgICAgICBCQU5EV0lEVEhfSFogPSA4MDAw
MDAwCgpbQ0hBTk5FTF0KICAgICAgICBERUxJVkVSWV9TWVNURU0gPSBEVkJUMgogICAgICAg
IEZSRVFVRU5DWSA9IDY0MjAwMDAwMAogICAgICAgIEJBTkRXSURUSF9IWiA9IDgwMDAwMDAK
CltDSEFOTkVMXQogICAgICAgIERFTElWRVJZX1NZU1RFTSA9IERWQlQyCiAgICAgICAgRlJF
UVVFTkNZID0gNjUwMDAwMDAwCiAgICAgICAgQkFORFdJRFRIX0haID0gODAwMDAwMAoKW0NI
QU5ORUxdCiAgICAgICAgREVMSVZFUllfU1lTVEVNID0gRFZCVDIKICAgICAgICBGUkVRVUVO
Q1kgPSA2NTgwMDAwMDAKICAgICAgICBCQU5EV0lEVEhfSFogPSA4MDAwMDAwCgpbQ0hBTk5F
TF0KICAgICAgICBERUxJVkVSWV9TWVNURU0gPSBEVkJUMgogICAgICAgIEZSRVFVRU5DWSA9
IDY2NjAwMDAwMAogICAgICAgIEJBTkRXSURUSF9IWiA9IDgwMDAwMDAKCltDSEFOTkVMXQog
ICAgICAgIERFTElWRVJZX1NZU1RFTSA9IERWQlQyCiAgICAgICAgRlJFUVVFTkNZID0gNjc0
MDAwMDAwCiAgICAgICAgQkFORFdJRFRIX0haID0gODAwMDAwMAoKW0NIQU5ORUxdCiAgICAg
ICAgREVMSVZFUllfU1lTVEVNID0gRFZCVDIKICAgICAgICBGUkVRVUVOQ1kgPSA2ODIwMDAw
MDAKICAgICAgICBCQU5EV0lEVEhfSFogPSA4MDAwMDAwCgpbQ0hBTk5FTF0KICAgICAgICBE
RUxJVkVSWV9TWVNURU0gPSBEVkJUMgogICAgICAgIEZSRVFVRU5DWSA9IDY5MDAwMDAwMAog
ICAgICAgIEJBTkRXSURUSF9IWiA9IDgwMDAwMDAK
--------------E54D23702A4E9BB21535740A--

