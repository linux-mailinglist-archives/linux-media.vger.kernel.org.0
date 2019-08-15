Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 284BE8F0A9
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 18:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731963AbfHOQeu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 12:34:50 -0400
Received: from jp.dhs.org ([62.251.46.73]:34802 "EHLO jpvw.nl"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730156AbfHOQeu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 12:34:50 -0400
Received: from jp by jpvw.nl with local (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hyIi7-00074J-7W; Thu, 15 Aug 2019 18:34:47 +0200
Date:   Thu, 15 Aug 2019 18:34:47 +0200
From:   Jan Pieter van Woerkom <jp@jpvw.nl>
To:     Sean Young <sean@mess.org>
Cc:     Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org, thomas.hollstegge@gmail.com
Subject: [PATCH 0/2] media: dvb-usb: move T230 to dvbsky
Message-ID: <20190815163447.GA26765@jpvw.nl>
References: <CAD+OKUpCVHUO1=mEGCx8Mx7TJLc4rJZjV8+Rgd_fRFrwpBDExA@mail.gmail.com>
 <20190719183542.GA25609@jpvw.nl>
 <CAD+OKUoCXV1LLM40Frm8VGoFDzhKmO__ALdsnttmfr=nueBFAg@mail.gmail.com>
 <2dcec967-35b0-315c-4cdf-0bcfe8e71cbc@jpvw.nl>
 <20190815101436.m73vlybkei7ij4oz@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815101436.m73vlybkei7ij4oz@gofer.mess.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media: dvb-usb: move t230 driver from cxusb to dvbsky

This solves (amongst others) the 'T230 dvb-t2 data
corruption since commit 5fa8815' problem.

The 'remove from cxusb' patch has 2 versions: the a
version applies to linux-5.2 and earlier, the b version
applies to linux 5.3-rc4 (and possibly others). Use one
or the other.

Thank you very much! :-)
