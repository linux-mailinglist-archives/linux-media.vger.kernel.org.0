Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A779BE1E1
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 18:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439662AbfIYQDv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 12:03:51 -0400
Received: from fallback16.mail.ru ([94.100.177.128]:42502 "EHLO
        fallback16.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfIYQDv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 12:03:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=list.ru; s=mail;
        h=Content-Type:MIME-Version:Date:Message-ID:Subject:From:To; bh=vDulfZYQWbWEXeCrgLPNRqyJVnnxORwziYcRKTBOR7Y=;
        b=KLirXtKNOBy5u+XZmV19aSgz+qhYvBQwE6grfJHBa8Lw9fux9QZ4xO4Ehfp1e/6iH/a9onAcxtBYGd/h0DSf31GkQ04ipTYhYJKLrNuSDLonRXRWbuNtOMf4NcjXfZoE8CQ3vAcX3OEsJZ4K87s8CAn28a3JRUEJkMrpA3CKXuM=;
Received: from [10.161.64.53] (port=35958 helo=smtp45.i.mail.ru)
        by fallback16.i with esmtp (envelope-from <citizen777@list.ru>)
        id 1iD9lc-0000Fc-Mj
        for linux-media@vger.kernel.org; Wed, 25 Sep 2019 19:03:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=list.ru; s=mail;
        h=Content-Type:MIME-Version:Date:Message-ID:Subject:From:To; bh=vDulfZYQWbWEXeCrgLPNRqyJVnnxORwziYcRKTBOR7Y=;
        b=KLirXtKNOBy5u+XZmV19aSgz+qhYvBQwE6grfJHBa8Lw9fux9QZ4xO4Ehfp1e/6iH/a9onAcxtBYGd/h0DSf31GkQ04ipTYhYJKLrNuSDLonRXRWbuNtOMf4NcjXfZoE8CQ3vAcX3OEsJZ4K87s8CAn28a3JRUEJkMrpA3CKXuM=;
Received: by smtp45.i.mail.ru with esmtpa (envelope-from <citizen777@list.ru>)
        id 1iD9la-0002kB-Rc
        for linux-media@vger.kernel.org; Wed, 25 Sep 2019 19:03:47 +0300
To:     linux-media@vger.kernel.org
From:   =?UTF-8?B?0JDQu9C10LrRgdC10Lk=?= <citizen777@list.ru>
Subject: Submit new entries in Digital TV scan tables
Message-ID: <d0645dae-eb7f-3de8-9e4a-d5924adc4d89@list.ru>
Date:   Wed, 25 Sep 2019 21:03:46 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------D83C4D73FAAE48C186E2C84F"
Content-Language: ru
X-77F55803: 260C666A7D66B36A5A78504BD2AC2941D965BF5F543491B39310B2C617C3E0EBC30ACDEED3B87C529097E6B2C7E7FAC7
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE745FB935E07B76C84EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063738685E03609DCDB88638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FC4E5AE632E181840BA2C33F17729B9F689911C73EEFED21EE389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0DEC8C2C8BCD2534D8941B15DA834481FCF19DD082D7633A0E7DDDDC251EA7DABA471835C12D1D977725E5C173C3A84C3E97D2AE7161E217F117882F4460429728AD0CFFFB425014E40A5AABA2AD371193AA81AA40904B5D9A18204E546F3947C241FAFF9BB01F7E7BA3038C0950A5D36C8A9BA7A39EFB766D187B4DA314F1B55BA3038C0950A5D36D5E8D9A59859A8B600E44CF7DE520BF03AA81AA40904B5D99449624AB7ADAF37F910319684D6E05D725E5C173C3A84C3375ACB23F92DE42536633A277C4D25776B0B6A749F1976AFC4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F05F538519369F3743B503F486389A921A5CC5B56E945C8DA
X-Mailru-Sender: 9157818B597D6E107E03AD0D443EDC13DE863694BD89343EF81C239AA93EEF9000680B3D8EF46AC98DD79C2AECECA6D3C77752E0C033A69ED4074B44CCDC8201E05E346907A1D06F3453F38A29522196
X-Mras: OK
X-77F55803: 5241C2F38277A35D7F9F52485CB584D7271FD7DF62800FDC8B1CC56BE943529A366C72D46E0C203207AD2BC72FA8EC4E951FA000EDE267C5
X-Mailru-MI: 800
X-Mras: OK
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------D83C4D73FAAE48C186E2C84F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello!
Please add my scan tables to your repository 
https://git.linuxtv.org/dtv-scan-tables.git/

path: root/dvb-t/ru-Perm

See attachment.


--------------D83C4D73FAAE48C186E2C84F
Content-Type: text/plain; charset=ISO-8859-5; x-mac-type="0"; x-mac-creator="0";
 name="ru-Perm"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="ru-Perm"

IyBTY2FuIHRhYmxlcyBmb3IgRFZCLVQyIGNoYW5uZWxzIGluIFBlcm0gKFJ1c3NpYSkKIyBD
cmVhdGVkIGZyb20gaHR0cHM6Ly9wZXJtLnJ0cnMucnUvdHYvY2hhbm5lbHMvCiMgQ29udHJp
YnV0ZWQgYnk6INCQ0LvQtdC60YHQtdC5INCc0LjRhdCw0LnQu9C+0LIgPGNpdGl6ZW43NzdA
bGlzdC5ydT4KIyBMYXN0IGNoYW5nZTogMjAxOS0wNC0zMAoKW9Cg0KLQoNChLTE6INCf0JXQ
oNCS0KvQmSDQmtCQ0J3QkNCbLCDQnNCQ0KLQpyEsINCd0KLQkiwg0J/Qr9Ci0KvQmSDQmtCQ
0J3QkNCbLCDQoNCe0KHQodCY0K8t0JosINCa0JDQoNCj0KHQldCb0KwsINCe0KLQoCwg0KLQ
kiDQptC10L3RgtGALCDQktCV0KHQotCYINCk0JwsINCc0JDQr9CaXQogICAgREVMSVZFUllf
U1lTVEVNID0gRFZCVDIKICAgIEZSRVFVRU5DWSA9IDQ5MDAwMDAwMAogICAgQkFORFdJRFRI
X0haID0gODAwMDAwMAogICAgQ09ERV9SQVRFX0hQID0gQVVUTwogICAgQ09ERV9SQVRFX0xQ
ID0gQVVUTwogICAgTU9EVUxBVElPTiA9IFFBTS9BVVRPCiAgICBUUkFOU01JU1NJT05fTU9E
RSA9IEFVVE8KICAgIEdVQVJEX0lOVEVSVkFMID0gQVVUTwogICAgSElFUkFSQ0hZID0gTk9O
RQogICAgSU5WRVJTSU9OID0gQVVUTwogICAgU1RSRUFNX0lEID0gMAoKW9Cg0KLQoNChLTE6
INCg0J7QodCh0JjQry0xLCDQoNCw0LTQuNC+INCg0L7RgdGB0LjQuF0KICAgIERFTElWRVJZ
X1NZU1RFTSA9IERWQlQyCiAgICBGUkVRVUVOQ1kgPSA0OTAwMDAwMDAKICAgIEJBTkRXSURU
SF9IWiA9IDgwMDAwMDAKICAgIENPREVfUkFURV9IUCA9IEFVVE8KICAgIENPREVfUkFURV9M
UCA9IEFVVE8KICAgIE1PRFVMQVRJT04gPSBRQU0vQVVUTwogICAgVFJBTlNNSVNTSU9OX01P
REUgPSBBVVRPCiAgICBHVUFSRF9JTlRFUlZBTCA9IEFVVE8KICAgIEhJRVJBUkNIWSA9IE5P
TkUKICAgIElOVkVSU0lPTiA9IEFVVE8KICAgIFNUUkVBTV9JRCA9IDEKClvQoNCi0KDQoS0x
OiDQoNCe0KHQodCY0K8tMjRdCiAgICBERUxJVkVSWV9TWVNURU0gPSBEVkJUMgogICAgRlJF
UVVFTkNZID0gNDkwMDAwMDAwCiAgICBCQU5EV0lEVEhfSFogPSA4MDAwMDAwCiAgICBDT0RF
X1JBVEVfSFAgPSBBVVRPCiAgICBDT0RFX1JBVEVfTFAgPSBBVVRPCiAgICBNT0RVTEFUSU9O
ID0gUUFNL0FVVE8KICAgIFRSQU5TTUlTU0lPTl9NT0RFID0gQVVUTwogICAgR1VBUkRfSU5U
RVJWQUwgPSBBVVRPCiAgICBISUVSQVJDSFkgPSBOT05FCiAgICBJTlZFUlNJT04gPSBBVVRP
CiAgICBTVFJFQU1fSUQgPSAyCgpb0KDQotCg0KEtMjog0KDQldCdINCi0JIsINCh0L/QsNGB
LCDQodCi0KEsINCU0L7QvNCw0YjQvdC40LksINCi0JIzLCDQn9GP0YLQvdC40YbQsCwg0JfQ
stC10LfQtNCwLCDQnNCY0KAsINCi0J3Qoiwg0JzQo9CXINCi0JJdCiAgICBERUxJVkVSWV9T
WVNURU0gPSBEVkJUMgogICAgRlJFUVVFTkNZID0gNjk4MDAwMDAwCiAgICBCQU5EV0lEVEhf
SFogPSA4MDAwMDAwCiAgICBDT0RFX1JBVEVfSFAgPSBBVVRPCiAgICBDT0RFX1JBVEVfTFAg
PSBBVVRPCiAgICBNT0RVTEFUSU9OID0gUUFNL0FVVE8KICAgIFRSQU5TTUlTU0lPTl9NT0RF
ID0gQVVUTwogICAgR1VBUkRfSU5URVJWQUwgPSBBVVRPCiAgICBISUVSQVJDSFkgPSBOT05F
CiAgICBJTlZFUlNJT04gPSBBVVRPCiAgICBTVFJFQU1fSUQgPSAwCg==
--------------D83C4D73FAAE48C186E2C84F--
