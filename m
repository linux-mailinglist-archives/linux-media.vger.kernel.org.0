Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9BB24F218
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 07:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgHXFOI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 01:14:08 -0400
Received: from smtpout3.pt.lu ([213.166.54.228]:39783 "EHLO smtpout3.pt.lu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725998AbgHXFOI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 01:14:08 -0400
X-Greylist: delayed 963 seconds by postgrey-1.27 at vger.kernel.org; Mon, 24 Aug 2020 01:14:07 EDT
Received: from smtp-1.pt.lu (unknown [192.168.20.201])
        by halon03.post.lu (Halon) with ESMTP
        id f019e143-e5c5-11ea-bdc7-005056b6ebfa;
        Mon, 24 Aug 2020 04:54:48 +0000 (UTC)
Received: from localhost (unknown [88.207.132.90])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jgmiller)
        by smtp-1.pt.lu (Post) with ESMTPSA id 699A65EE2A
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2020 06:58:02 +0200 (CEST)
To:     <linux-media@vger.kernel.org>
Subject: Update DVB Scan table for uk-Storeton
X-Mailer: mail (GNU Mailutils 2.99.99)
From:   J G Miller <miller@yoyo.ORG>
Date:   Mon, 24 Aug 2020 06:57:58 +0200
Message-Id: <1kA4YQ-0001oL-97@localhost>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Greetings,

Thank you for all the work the LinuxTV team does in keeping DVB-c, DVB-t,
DVB-s tables up to date.

Due to the 700 MHz clearance in the UKofGB&NI there have been numerous changes
over the last couple of years with the most recent on August 12th, 2020
for North West England and the Winter Hill transmitter group, which were
postponed from March 2020 due to the Covid-19 epidemic crisis in the
UKofGB&NI.

I am providing the latest update for the "uk-Storeton" transmitter below
at the end of the message.

Please note that your automated method of retrieving this data has never
included the three additional multiplexes carrying the Wales region programs
(as opposed to the main North West region programs) which are transmitted
from Storeton as a relay to Moel-y-Parc, Clwyd.  Storeton is in Wirral which is
the peninsula betwixt Mersey (Liverpool to the East) and Dee (Clwyd,
Wales to the West).

If you wish to check on official data, the apparently only sources of information
on UKofGB&NI digital tv transmissions are buried and hidden away on the
Freeview web site.  The official Digital UK site has not been updated since
March 2018 and links on that site just get re-directed to the useless dumb
Freeview site main page.

North West region transmitters:

<https://www.freeview.co.uk/sites/default/files/2020-07/700mhz-clearance-events-granada-region-16-july-2020.pdf>

(NB For commercial TV purposes, the North West England region is known
as Granada, even though Granada is a province in the South East of Spain.)

Wales region transmitter:

<https://www.freeview.co.uk/sites/default/files/2020-07/700mhz-clearance-events-wales-july-2020.pdf>

Getting information about the transmitters for the different regions
is impossible without entering a postal code into the Freeview post code checker,
and then finding some further link on the page for more technical details,
unless you can go directly on to one of the hidden regional pages, eg

<https://www.freeview.co.uk/help/coverage-checker/detailed-view/london>

where you can then select whichever region you wish to see for a list of transmitters
with multiplex UHF transmission channel details.

Increasingly in the UKofGB&NI, technical information is being hidden
away behind mindless people-are-too-stupid corporate advertizing where
we are only going to tell you what we think you should know facades.

With best wishes,
Greg Miller

-----------------------------------<cut here>------------------------------------------
#*****************************************************************************#
#|
#|  file : /usr/local/share/dvb/dvb-t/uk-Storeton
#|
#*---------------------------------------------------------------------------*#

[c22 PSB3 BBC B - North West]
	FREQUENCY		= 482000000
	BANDWIDTH_HZ		= 8000000
	DELIVERY_SYSTEM		= DVBT2
	MODULATION		= QAM/256
	TRANSMISSION_MODE	= 32K
	GUARD_INTERVAL		= 1/128
	CODE_RATE_HP		= 2/3
	CODE_RATE_LP		= NONE
	HIERARCHY		= NONE
	INVERSION		= AUTO

[c23 COM4 SDN]
	FREQUENCY		= 490000000
	BANDWIDTH_HZ		= 8000000
	DELIVERY_SYSTEM		= DVBT
	MODULATION		= QAM/64
	TRANSMISSION_MODE	= 8K
	GUARD_INTERVAL		= 1/32
	CODE_RATE_HP		= 3/4
	CODE_RATE_LP		= NONE
	HIERARCHY		= NONE
	INVERSION		= AUTO

[c25 PSB2 D3&4 - Granada]
	FREQUENCY		= 506000000
	BANDWIDTH_HZ		= 8000000
	DELIVERY_SYSTEM		= DVBT
	MODULATION		= QAM/64
	TRANSMISSION_MODE	= 8K
	GUARD_INTERVAL		= 1/32
	CODE_RATE_HP		= 2/3
	CODE_RATE_LP		= NONE
	HIERARCHY		= NONE
	INVERSION		= AUTO

[c26 COM5 Arqiva A]
	FREQUENCY		= 514000000
	BANDWIDTH_HZ		= 8000000
	DELIVERY_SYSTEM		= DVBT
	MODULATION		= QAM/64
	TRANSMISSION_MODE	= 8K
	GUARD_INTERVAL		= 1/32
	CODE_RATE_HP		= 3/4
	CODE_RATE_LP		= NONE
	HIERARCHY		= NONE
	INVERSION		= AUTO

[c28 PSB1 BBC A - North West]
	FREQUENCY		= 492000000
	BANDWIDTH_HZ		= 8000000
	DELIVERY_SYSTEM		= DVBT
	MODULATION		= QAM/64
	TRANSMISSION_MODE	= 8K
	GUARD_INTERVAL		= 1/32
	CODE_RATE_HP		= 2/3
	CODE_RATE_LP		= NONE
	HIERARCHY		= NONE
	INVERSION		= AUTO

[c30 COM6 Arqiva B]
	FREQUENCY		= 546000000
	BANDWIDTH_HZ		= 8000000
	DELIVERY_SYSTEM		= DVBT
	MODULATION		= QAM/64
	TRANSMISSION_MODE	= 8K
	GUARD_INTERVAL		= 1/32
	CODE_RATE_HP		= 3/4
	CODE_RATE_LP		= NONE
	HIERARCHY		= NONE
	INVERSION		= AUTO

[c39 PSB2 D3&4 - Wales]
	FREQUENCY		= 618166000
	BANDWIDTH_HZ		= 8000000
	DELIVERY_SYSTEM		= DVBT
	MODULATION		= QAM/64
	TRANSMISSION_MODE	= 8K
	GUARD_INTERVAL		= 1/32
	CODE_RATE_HP		= 2/3
	CODE_RATE_LP		= NONE
	HIERARCHY		= NONE
	INVERSION		= AUTO

[c42 PSB3 BBC B - Wales]
	FREQUENCY		= 642000000
	BANDWIDTH_HZ		= 8000000
	DELIVERY_SYSTEM		= DVBT2
	MODULATION		= QAM/256
	TRANSMISSION_MODE	= 32K
	GUARD_INTERVAL		= 1/128
	CODE_RATE_HP		= 2/3
	CODE_RATE_LP		= NONE
	HIERARCHY		= NONE
	INVERSION		= AUTO

[c43 Local - Liverpool TV]
	FREQUENCY		= 650000000
	BANDWIDTH_HZ		= 8000000
	DELIVERY_SYSTEM		= DVBT
	MODULATION		= QPSK
	TRANSMISSION_MODE	= 8K
	GUARD_INTERVAL		= 1/32
	CODE_RATE_HP		= 3/4
	CODE_RATE_LP		= NONE
	HIERARCHY		= NONE
	INVERSION		= AUTO

[c45 PSB1 BBC A - Wales]
	FREQUENCY		= 666000000
	BANDWIDTH_HZ		= 8000000
	DELIVERY_SYSTEM		= DVBT
	MODULATION		= QAM/64
	TRANSMISSION_MODE	= 8K
	GUARD_INTERVAL		= 1/32
	CODE_RATE_HP		= 2/3
	CODE_RATE_LP		= NONE
	HIERARCHY		= NONE
	INVERSION		= AUTO

#*****************************************************************************#
-----------------------------------<cut here>------------------------------------------
