Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 931ED2E329B
	for <lists+linux-media@lfdr.de>; Sun, 27 Dec 2020 20:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgL0Tpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Dec 2020 14:45:46 -0500
Received: from mail.initworks.com ([80.69.72.54]:34079 "EHLO
        mail.initworks.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbgL0Tpq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Dec 2020 14:45:46 -0500
X-Greylist: delayed 422 seconds by postgrey-1.27 at vger.kernel.org; Sun, 27 Dec 2020 14:45:44 EST
Received: from webmail.initworks.com (unknown [10.1.44.88])
        (Authenticated sender: marc.cust210)
        by mail.initworks.com (Postfix) with ESMTPA id B39C4E28E
        for <linux-media@vger.kernel.org>; Sun, 27 Dec 2020 20:37:58 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sun, 27 Dec 2020 20:37:58 +0100
From:   Marc van Wageningen <marc@vanwageningen.eu>
To:     linux-media@vger.kernel.org
Subject: Add Logitech B910 webcam to supported list
Message-ID: <5ea531c2eb814991c58f2ec77ab8c9be@webmail.initworks.com>
X-Sender: marc@vanwageningen.eu
User-Agent: Roundcube Webmail/1.2.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I would like to inform you that my recently bought camera could be added 
to the list on
https://www.ideasonboard.org/uvc/

Bus 001 Device 004: ID 046d:0823 Logitech, Inc. HD Webcam B910
Device Descriptor:
bLength 18
bDescriptorType 1
bcdUSB 2.00
bDeviceClass 239 Miscellaneous Device
bDeviceSubClass 2
bDeviceProtocol 1 Interface Association
bMaxPacketSize0 64
idVendor 0x046d Logitech, Inc.
idProduct 0x0823 HD Webcam B910
bcdDevice 0.10
iManufacturer 0
iProduct 0
iSerial 1 05BACB20
bNumConfigurations 1
Configuration Descriptor:
bLength 9
bDescriptorType 2
wTotalLength 0x0cc1
bNumInterfaces 4
bConfigurationValue 1
iConfiguration 0
bmAttributes 0x80
(Bus Powered)
MaxPower 500mA

Works as expected on Fedora 33 x86_64,  kernel 5.9.15-200.fc33.x86_64

Regards,

Marc

